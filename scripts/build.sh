#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

# 保留试卷目录层级，将所有试卷编译到 output/pdf。
while IFS= read -r -d '' source; do
  relative="${source#questions/}"
  output="output/pdf/${relative%.typ}.pdf"
  mkdir -p "$(dirname "$output")"
  # 单独捕获计时结果，编译输出仍显示在终端。
  {
    elapsed=$(
      TIMEFORMAT='%3R'
      { time typst compile --root . --font-path fonts "$source" "$output" >&3 2>&4; } 2>&1
    )
  } 3>&1 4>&2
  elapsed_ms=$(awk -v seconds="$elapsed" 'BEGIN { printf "%.0f", seconds * 1000 }')
  printf 'Generated %s in %sms\n' "$output" "$elapsed_ms"
done < <(find questions -type f -name '*.typ' -print0)
