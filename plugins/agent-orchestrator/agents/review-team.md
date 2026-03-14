---
name: review-team
description: Agent team for comprehensive code review. Spawns parallel reviewers for code quality, security, and performance that produce a combined report.
---

# Review Team

Spawn this team before merging big features.

## Team Composition
```
Orchestrator
├── Teammate 1: code-reviewer (quality + correctness)
├── Teammate 2: security-auditor (vulnerabilities + compliance)
└── Teammate 3: performance-reviewer (bottlenecks + optimization)
```

## Spawn Command
```
Create a review team to audit [branch/feature]:
- Code reviewer: check correctness, patterns, test coverage
- Security auditor: check OWASP Top 10, secrets, auth
- Performance reviewer: check N+1 queries, re-renders, indexes

Each reviewer works independently on the same codebase.
Produce a combined report with findings organized by severity.
```
