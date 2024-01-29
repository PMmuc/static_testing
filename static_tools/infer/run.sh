mkdir -p "$SHARED/findings"

"$STA/repo/bin/infer" run  --compilation-database "$OUT/compile_commands.json" --biabduction-only