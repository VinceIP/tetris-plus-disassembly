#!/usr/bin/env bash
# thanks, chatgpt
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: ./build.sh output.gb"
  exit 1
fi

OUT="$1"
BASE="${OUT%.*}"
OBJ="${BASE}.o"
SYM="${BASE}.sym"

ORIG="baserom.gb"

if [[ ! -f "$ORIG" ]]; then
  echo "ERROR: baserom.gb not found in current directory."
  exit 1
fi

echo "Building $OUT ..."
echo

rgbasm -o "$OBJ" game.asm
rgblink -o "$OUT" -n "$SYM" "$OBJ"
rgbfix -v -p 0xFF "$OUT"

echo
echo "Comparing SHA256..."

ORIG_HASH=$(sha256sum "$ORIG" | awk '{print $1}')
NEW_HASH=$(sha256sum "$OUT" | awk '{print $1}')

if [[ "$ORIG_HASH" == "$NEW_HASH" ]]; then
  echo "OK — Match"
  echo "$NEW_HASH"
else
  echo "MISMATCH"
  echo "Original: $ORIG_HASH"
  echo "Rebuilt : $NEW_HASH"
fi