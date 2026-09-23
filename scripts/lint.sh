#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

typstyle --check src questions

while IFS= read -r -d '' source; do
  tinymist lint --root . --font-path fonts "$source"
  printf 'Checked %s\n' "$source"
done < <(find questions -type f -name '*.typ' -print0)
