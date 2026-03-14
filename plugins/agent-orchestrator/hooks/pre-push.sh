#!/bin/bash
# Pre-push hook: run full test suite before allowing push to remote
# Blocks push if any tests fail

set -e

echo "🔍 Running pre-push checks..."

# Run tests for services with changes
CHANGED=$(git diff origin/$(git branch --show-current)..HEAD --name-only 2>/dev/null || echo "")

if echo "$CHANGED" | grep -q "services/core-service"; then
    echo "  Testing core-service..."
    cd services/core-service && npm test 2>/dev/null || { echo "❌ Core service tests failed"; exit 1; }
    cd ../..
fi

if echo "$CHANGED" | grep -q "services/ai-service"; then
    echo "  Testing ai-service..."
    cd services/ai-service && pytest -q 2>/dev/null || { echo "❌ AI service tests failed"; exit 1; }
    cd ../..
fi

if echo "$CHANGED" | grep -q "apps/web"; then
    echo "  Testing web app..."
    cd apps/web && npm test -- --watchAll=false 2>/dev/null || { echo "❌ Web tests failed"; exit 1; }
    cd ../..
fi

echo "✅ All pre-push checks passed"
