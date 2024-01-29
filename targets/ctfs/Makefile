RELRO_FLAGS = -Wl,-z,relro,-z,now
FORTIFY_FLAGS = -D_GLIBCXX_ASSERTIONS=1
STACK_FLAGS = -fstack-protector-all -fstack-clash-protection
CET_FLAGS = -fcf-protection
CXX_FLAGS = -fno-rtti -fno-exceptions -O2 -std=c++20
W_FLAGS = -Wall -Wextra -Wpedantic -Werror

all: stringbins notes heap-2022 tinypad

stringbins: stringbins.c
	$(CC) -O3 \
		-Wl,-z,relro,-z,now\
		-fstack-protector \
		-fcf-protection=none \
		-o stringbins \
		stringbins.c
		
notes: notes.cpp
	$(CXX) $(RELRO_FLAGS) $(FORTIFY_FLAGS) $(STACK_FLAGS) $(CET_FLAGS) $(CXX_FLAGS) $(W_FLAGS) $^ -o $@
	
heap-2022: heap-2022.c
	$(CC) -O3 \
		-Wl,-z,relro,-z,now\
		-fstack-protector \
		-fcf-protection=none \
		-o heap-2022 \
		heap-2022.c

tinypad: tinypad.c
	$(CC) -O3 \
		-Wl,-z,relro,-z,now\
		-fstack-protector \
		-fcf-protection=none \
		-o tinypad \
		tinypad.c \
		pwnio.c

dropped: dropped.c
	$(CC) -fno-stack-protector -no-pie -Wl,-z,relro,-z,now -O3 -g $^ -o $@


clean:
	$(RM) notes stringbins tinypad heap-2022 *.o *.bc

.PHONY: clean
