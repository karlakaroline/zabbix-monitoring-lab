#!/usr/bin/env bash
set -u

TARGET="${1:-/var}"

echo "=== Filesystem Triage ==="
echo "Target: $TARGET"
echo

echo "[1] Filesystem usage"
df -h "$TARGET" 2>/dev/null || df -h
echo

echo "[2] Inode usage"
df -i "$TARGET" 2>/dev/null || df -i
echo

echo "[3] Largest first-level entries"
du -xhd1 "$TARGET" 2>/dev/null | sort -h | tail -20
echo

echo "[4] Deleted files still held open"
if command -v lsof >/dev/null 2>&1; then
  lsof +L1 2>/dev/null | head -30
else
  echo "lsof is not installed."
fi

echo
echo "No cleanup is performed by this script. Review findings before taking action."
