#!/bin/bash
# Post-commit hook: update progress tracker after each commit
# Appends commit info to claude-progress.txt

COMMIT_HASH=$(git rev-parse --short HEAD)
COMMIT_MSG=$(git log -1 --format='%s')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
BRANCH=$(git branch --show-current)

echo "[$TIMESTAMP] $COMMIT_HASH | $BRANCH | $COMMIT_MSG" >> claude-progress.txt 2>/dev/null || true
