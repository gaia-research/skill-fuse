#!/usr/bin/env bash
# Install skill-fuse into your agent skills directory.
set -euo pipefail

# Detect target
TARGET=""
for d in .agents/skills .claude/skills; do
  [[ -d "$d" ]] && TARGET="$d" && break
done
[[ -z "$TARGET" ]] && TARGET=".agents/skills" && mkdir -p "$TARGET"

# Clone and clean
git clone --depth 1 https://github.com/mbtiongson1/skill-fuse.git "$TARGET/fuse" 2>/dev/null
rm -rf "$TARGET/fuse/.git"

echo ""
echo "  skill-fuse installed to $TARGET/fuse"
echo "  Invoke with: /fuse"
echo ""
