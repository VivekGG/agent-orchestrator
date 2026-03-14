#!/bin/bash
# Post-edit hook: auto-format files after Claude edits them
# Detects file type and runs appropriate formatter

FILE="$1"
EXT="${FILE##*.}"

case "$EXT" in
    ts|tsx|js|jsx|json)
        npx prettier --write "$FILE" 2>/dev/null
        ;;
    py)
        ruff format "$FILE" 2>/dev/null
        ;;
    dart)
        dart format "$FILE" 2>/dev/null
        ;;
    kt|kts)
        # ktlint if available
        ktlint --format "$FILE" 2>/dev/null
        ;;
esac
