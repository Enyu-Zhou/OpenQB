#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

source ./scripts/paper-sources.sh "$@"
if [[ "$#" -eq 0 ]]; then
  typstyle --check src questions
else
  typstyle --check "${papers[@]}"
fi

for source in "${papers[@]}"; do
  tinymist lint --root . --font-path fonts --ignore-system-fonts "$source"
  printf 'Checked %s\n' "$source"
done
