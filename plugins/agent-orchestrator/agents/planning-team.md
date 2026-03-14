---
name: planning-team
description: Agent team for comprehensive feature planning. Spawns parallel planners for product, architecture, and UX that produce coordinated specs.
---

# Planning Team

## Interaction Rule

**ALWAYS use the `AskUserQuestion` tool** when you need anything from the user — approvals, confirmations, clarifications, or choices. NEVER write questions as plain text.

```
# Correct — use the tool:
AskUserQuestion("Do you want to proceed?", options=["Yes, proceed", "No, cancel"])

# Wrong — never do this:
"Should I proceed? Let me know."
```


Spawn this team for big features that need comprehensive specs before building.

## Team Composition
```
Orchestrator
├── Teammate 1: product-manager (requirements + stories)
├── Teammate 2: system-architect (architecture + API design)
├── Teammate 3: database-architect (schema + migrations)
└── Teammate 4: ui-designer (wireframes + component specs)
```

## Spawn Command
```
Create a planning team for [feature description]:
- Product manager: write requirements and user stories
- System architect: design the architecture and API
- Database architect: design the schema
- UI designer: create wireframes and component specs

Coordinate to ensure consistency between all specs.
Product manager produces requirements first, then architects design in parallel.
```
