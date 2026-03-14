---
description: "Undo last agent changes — git-based rollback to previous state. Can rollback by commit count, to a specific commit, or to last checkpoint."
argument-hint: "<count: number of commits> OR <commit-hash> OR 'last-checkpoint'"
disable-model-invocation: true
---

## Mission
Safely undo agent changes using git.

## Options
```
/rollback 1               → undo last 1 commit
/rollback 5               → undo last 5 commits
/rollback abc1234         → rollback to specific commit
/rollback last-checkpoint → rollback to last /backup checkpoint
```

## Steps
1. Show what will be rolled back: `git log --oneline -N`
2. Use **AskUserQuestion tool**: "This will undo N commits. Proceed?" → ["Yes, rollback", "No, cancel"]
3. Execute only if confirmed: `git reset --hard HEAD~N` or `git reset --hard <hash>`
4. Verify: `git status` + run tests

## Safety Rules
- ALWAYS show what will be undone before executing
- ALWAYS use AskUserQuestion tool to confirm with user — never assume consent
- NEVER rollback past the initial commit
- Suggest `/backup` before risky rollbacks
