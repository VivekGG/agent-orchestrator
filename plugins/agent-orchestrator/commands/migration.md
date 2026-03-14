---
description: "Create and manage database migrations for both NestJS (Prisma) and Python (Django) services."
argument-hint: "<action: create | apply | rollback | status> <service: core | ai>"
disable-model-invocation: true
---

## Mission
Manage database migrations across services.

## Actions
- **create**: Generate new migration from schema changes
  - NestJS: `npx prisma migrate dev --name [description]`
  - Python: `python manage.py makemigrations`

- **apply**: Run pending migrations
  - NestJS: `npx prisma migrate deploy`
  - Python: `python manage.py migrate`

- **rollback**: Revert last migration
  - NestJS: Revert in schema + `npx prisma migrate dev`
  - Python: `python manage.py migrate [app] [previous_migration]`

- **status**: Show pending migrations
  - NestJS: `npx prisma migrate status`
  - Python: `python manage.py showmigrations`
