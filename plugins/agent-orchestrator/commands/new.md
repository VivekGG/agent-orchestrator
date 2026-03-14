---
description: "Start a new project or feature. THE entry point for all new work. ALWAYS runs the full 21-agent pipeline (planning → design → build → test → security → review → devops → docs) regardless of project size."
argument-hint: "<what you want to build>"
---

## Mission
Route to the project-orchestrator agent which runs the FULL 9-phase pipeline with ALL 21 agents.

## CRITICAL: Full Pipeline Always
Every request gets ALL 21 agents — even "simple" or "local" projects.
Task size (SMALL/MEDIUM/BIG) only determines approval gates, NOT which agents run.

## Steps
1. Pass the user's description to project-orchestrator
2. Orchestrator asks 2-3 clarifying questions
3. Orchestrator classifies size for approval gates only:
   - SMALL (1-3 files): all agents run, no approval needed
   - MEDIUM (4-10 files): all agents run, one approval gate
   - BIG (10+ files): all agents run, four approval gates
4. ALL 9 phases execute with ALL 21 agents:

```
Phase 1: product-manager + business-analyst + ux-researcher
Phase 2: system-architect + api-architect + database-architect + ui-designer
Phase 3: senior-engineer + backend-developer + frontend-developer + python-developer
Phase 4: test-engineer + qa-automation
Phase 5: security-auditor
Phase 6: code-reviewer + performance-reviewer
Phase 7: devops-engineer + deployment-engineer
Phase 8: technical-writer
Phase 9: project-orchestrator + task-executor (coordination)
```

No agents are ever skipped. A "local todo app" gets the same agent coverage as a "production SaaS".
