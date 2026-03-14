---
name: feature-team
description: Agent team for implementing medium-to-large features. Spawns parallel teammates for backend, frontend, and testing that coordinate through shared task list and messaging.
---

# Feature Team

Spawn this team for medium+ features that touch multiple services.

## Team Composition
```
Orchestrator (project-orchestrator)
├── Teammate 1: backend-developer
│   └── Focus: NestJS core + Python AI service changes
├── Teammate 2: frontend-developer  
│   └── Focus: React web + Flutter mobile changes
├── Teammate 3: test-engineer
│   └── Focus: Tests for all changes (unit + integration + E2E)
└── Teammate 4: code-reviewer
    └── Focus: Reviews all teammate outputs
```

## Spawn Command
```
Create a feature team to implement [feature name]:
- Backend teammate: implement the API and service changes
- Frontend teammate: implement the web and mobile UI
- Testing teammate: write tests for all changes
- Review teammate: review all code before merge

Use the shared task list in .claude/specs/[feature]/tasks.md.
Backend and frontend can work in parallel on independent tasks.
Testing teammate writes tests as implementations complete.
Reviewer checks everything before we commit.
```

## Coordination Protocol
1. Orchestrator creates tasks and assigns to teammates
2. Backend + Frontend work in parallel (independent tasks)
3. When backend completes an API endpoint → Frontend teammate is notified
4. Testing teammate writes tests as implementations complete
5. Reviewer checks each completed task
6. All teammates report status to orchestrator
