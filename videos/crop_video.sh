#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 2 || $# -gt 6 ]]; then
  echo "Usage: $0 INPUT OUTPUT [WIDTH] [HEIGHT] [X] [Y]" >&2
  echo "Example: $0 input.mp4 output.mp4 480 240 0 0" >&2
  exit 1
fi

input=$1
output=$2
width=${3:-480}
height=${4:-240}
x=${5:-0}
y=${6:-0}

ffmpeg -y -i "$input" \
  -vf "crop=${width}:${height}:${x}:${y}" \
  -c:v libx264 -crf 18 -preset medium \
  -c:a copy \
  "$output"
