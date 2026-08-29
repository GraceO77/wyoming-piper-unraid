#!/bin/sh
set -eu

URI="${PIPER_URI:-tcp://0.0.0.0:10200}"
VOICE="${PIPER_VOICE:-en_US-lessac-medium}"
DATA_DIR="${PIPER_DATA_DIR:-/data}"
DOWNLOAD_DIR="${PIPER_DOWNLOAD_DIR:-/data}"

set -- python -m wyoming_piper \
  --uri "$URI" \
  --voice "$VOICE" \
  --data-dir "$DATA_DIR" \
  --download-dir "$DOWNLOAD_DIR"

if [ -n "${PIPER_LENGTH_SCALE:-}" ]; then
  set -- "$@" --length-scale "$PIPER_LENGTH_SCALE"
fi

if [ -n "${PIPER_NOISE_SCALE:-}" ]; then
  set -- "$@" --noise-scale "$PIPER_NOISE_SCALE"
fi

if [ -n "${PIPER_NOISE_W:-}" ]; then
  set -- "$@" --noise-w "$PIPER_NOISE_W"
fi

exec "$@"
