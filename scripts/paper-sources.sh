#!/usr/bin/env bash

# 由格式化、检查和构建脚本在仓库根目录加载，不传参数时选择所有试卷。
papers=()
if [[ "$#" -gt 1 ]]; then
  printf 'Usage: %s [questions/path/to/paper.typ]\n' "$0" >&2
  exit 2
elif [[ "$#" -eq 1 ]]; then
  if [[ "$1" != *.typ || ! -f "$1" ]]; then
    printf 'Paper must be an existing .typ file: %s\n' "$1" >&2
    exit 2
  fi
  paper="$(cd "$(dirname "$1")" && pwd -P)/$(basename "$1")"
  root="$(pwd -P)"
  if [[ "$paper" != "$root"/questions/* ]]; then
    printf 'Paper must be inside questions/: %s\n' "$1" >&2
    exit 2
  fi
  papers=("${paper#"$root"/}")
else
  while IFS= read -r -d '' paper; do
    papers+=("$paper")
  done < <(find questions -type f -name '*.typ' -print0)
fi
