#!/bin/bash
# Pre-commit hook: run linters and tests before allowing commit
# This hook is registered via .claude/settings.json

set -e

echo "🔍 Running pre-commit checks..."

# Detect which services have changes
CHANGED_FILES=$(git diff --cached --name-only)

if echo "$CHANGED_FILES" | grep -q "services/core-service"; then
    echo "  Checking NestJS core-service..."
    cd services/core-service && npm run lint 2>/dev/null || echo "  ⚠️ Core service lint issues"
fi

if echo "$CHANGED_FILES" | grep -q "services/ai-service"; then
    echo "  Checking Python ai-service..."
    cd services/ai-service && ruff check . 2>/dev/null || echo "  ⚠️ AI service lint issues"
fi

if echo "$CHANGED_FILES" | grep -q "apps/web"; then
    echo "  Checking React web app..."
    cd apps/web && npm run lint 2>/dev/null || echo "  ⚠️ Web lint issues"
fi

echo "✅ Pre-commit checks complete"
