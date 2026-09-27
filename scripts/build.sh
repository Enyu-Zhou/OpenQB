#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

source ./scripts/paper-sources.sh "$@"

# 保留试卷目录层级，生成试题版和解析版。
for source in "${papers[@]}"; do
  relative="${source#questions/}"
  for variant in without-answers with-answers; do
    suffix=""
    show_answers="false"
    if [[ "$variant" == "with-answers" ]]; then
      suffix="-解析版"
      show_answers="true"
    fi
    output="output/pdf/${relative%.typ}${suffix}.pdf"
    mkdir -p "$(dirname "$output")"
    # 单独捕获计时结果，编译输出仍显示在终端。
    {
      elapsed=$(
        TIMEFORMAT='%3R'
        { time typst compile --root . --font-path fonts --ignore-system-fonts --input "show-answers=$show_answers" "$source" "$output" >&3 2>&4; } 2>&1
      )
    } 3>&1 4>&2
    elapsed_ms=$(awk -v seconds="$elapsed" 'BEGIN { printf "%.0f", seconds * 1000 }')
    printf 'Generated %s in %sms\n' "$output" "$elapsed_ms"
  done
done
