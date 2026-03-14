---
description: "Run the complete test suite across ALL services — unit, integration, E2E, security, accessibility. Reports pass/fail per service."
---

## Interaction Rule
When confirmation, clarification, or approval is needed, **always use the `AskUserQuestion` tool** — never write questions as plain text.


## Mission
Execute every test in the project and report results.

## Execution
```bash
echo "╔══════════════════════════════════════╗"
echo "║    RUNNING COMPLETE TEST SUITE       ║"
echo "╚══════════════════════════════════════╝"

echo "\n[1/8] NestJS Core Service — Unit Tests"
cd services/core-service && npm test -- --coverage 2>&1 | tail -5

echo "\n[2/8] NestJS API Gateway — Unit Tests"  
cd services/api-gateway && npm test -- --coverage 2>&1 | tail -5

echo "\n[3/8] Python AI Service — Unit Tests"
cd services/ai-service && pytest --cov --cov-report=term-missing -q 2>&1 | tail -5

echo "\n[4/8] React Web App — Unit Tests"
cd apps/web && npm test -- --coverage --watchAll=false 2>&1 | tail -5

echo "\n[5/8] Flutter Mobile — Unit Tests"
cd apps/mobile-flutter && flutter test --coverage 2>&1 | tail -5

echo "\n[6/8] E2E Tests (Playwright)"
cd apps/web && npx playwright test 2>&1 | tail -10

echo "\n[7/8] Security Scan"
cd services/core-service && npm audit --audit-level=high 2>&1 | tail -3
cd services/ai-service && pip-audit 2>&1 | tail -3

echo "\n[8/8] Accessibility Audit"
cd apps/web && npx playwright test --grep @a11y 2>&1 | tail -5
```

## Report Format
```
╔════════════════════════════════════════════╗
║            TEST RESULTS SUMMARY            ║
╠════════════════════════════════════════════╣
║ Service              │ Status │ Coverage   ║
║──────────────────────│────────│────────────║
║ NestJS Core          │ ✅ PASS│ 85%        ║
║ NestJS Gateway       │ ✅ PASS│ 78%        ║
║ Python AI Service    │ ✅ PASS│ 82%        ║
║ React Web            │ ✅ PASS│ 76%        ║
║ Flutter Mobile       │ ❌ FAIL│ 71%        ║
║ E2E (Playwright)     │ ✅ PASS│ —          ║
║ Security Scan        │ ⚠️ WARN│ 2 moderate ║
║ Accessibility        │ ✅ PASS│ —          ║
╠════════════════════════════════════════════╣
║ OVERALL: 7/8 PASSED  │ 1 FAILURE          ║
╚════════════════════════════════════════════╝
```
