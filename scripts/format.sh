#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

source ./scripts/paper-sources.sh "$@"

if [[ "$#" -eq 0 ]]; then
  typstyle --inplace src questions
else
  typstyle --inplace "${papers[@]}"
fi
