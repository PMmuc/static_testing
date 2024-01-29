mkdir -p "$SHARED/findings"

"$STA/codeql" database create $OUT/db --language=cpp --command="make" -s="$TARGET"

"$STA/codeql" database analyze  --output=$OUT/res --format=csv -- $OUT/db