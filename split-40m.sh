#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 || ! -f "$1" ]]; then
  echo "Usage: $0 FILE" >&2
  exit 2
fi

file=$1
base=$(basename "$file")
out="${base}.parts"
mkdir -p "$out"
split --bytes=40M --numeric-suffixes=1 --suffix-length=4 \
  -- "$file" "$out/${base}.part"
echo "Created 40 MiB chunks in $out"
