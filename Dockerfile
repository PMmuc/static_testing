FROM ubuntu:22.04
## build docker with infer
## docker build --build-arg target_name=ctfs --build-arg sta_tool=infer .
## docker build --build-arg target_name=libxml --build-arg sta_tool=infer .
## docker build --build-arg target_name=libxml2 --build-arg sta_tool=ikos .
## run with:
## docker run -dit -p 80:80 <image_id>

RUN apt-get update && apt-get install -y sudo

## Magma directory hierachy
# magma_root is relative to the docker-build's working directory
# The Docker image must be built in the root of the magma directory
ARG magma_root=.
ENV TZ=Europe/Berlin\
	DEBIAN_FRONTEND=noninteractive
	
ENV MAGMA_R /magma
ENV OUT /magma_out
ENV SHARED /magma_shared

ENV CC  /usr/bin/gcc
ENV CXX /usr/bin/g++
ENV LD /usr/bin/ld
ENV AR /usr/bin/ar
ENV AS /usr/bin/as
ENV NM /usr/bin/nm
ENV RANLIB /usr/bin/ranlib

ARG USER_ID=1001
ARG GROUP_ID=1001

RUN mkdir -p /home && \
	groupadd -g ${GROUP_ID} magma && \
	useradd -l -u ${USER_ID} -K UMASK=0000 -d /home -g magma magma && \
	chown magma:magma /home
RUN echo "magma:magma" |chpasswd && usermod -a -G sudo magma

RUN mkdir -p ${SHARED} ${OUT} && \
	chown magma:magma ${SHARED} ${OUT} && \
	chmod 744 ${SHARED} ${OUT}
	
ARG magma_path=magma
ENV  MAGMA ${MAGMA_R}/${magma_path}
USER root:root
RUN mkdir -p ${MAGMA} && chown magma:magma ${MAGMA}
COPY --chown=magma:magma ${magma_root}/${magma_path} ${MAGMA}/
RUN ${MAGMA}/preinstall.sh
USER magma:magma

ARG sta_tool
ARG sta_path=static_tools/${sta_tool}
ENV STA ${MAGMA_R}/${sta_path}
USER root:root
RUN mkdir -p ${STA} && chown magma:magma ${STA}
COPY --chown=magma:magma ${magma_root}/${sta_path} ${STA}/
RUN ${STA}/preinstall.sh
USER magma:magma
RUN ${STA}/fetch.sh
RUN ${STA}/build.sh

## Fetch one target and apply the patches.
ARG target_name
ARG target_path=targets/${target_name}
ENV TARGET ${MAGMA_R}/${target_path}
USER root:root
RUN mkdir -p ${TARGET} && chown magma:magma ${TARGET}
COPY --chown=magma:magma ${magma_root}/${target_path} ${TARGET}/
RUN ${TARGET}/preinstall.sh
USER magma:magma
RUN ${TARGET}/fetch.sh
RUN ${MAGMA}/apply_patches.sh
RUN ${TARGET}/build.sh

#ENTRYPOINT "${MAGMA}/run.sh"