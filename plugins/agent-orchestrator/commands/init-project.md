---
description: "Full project initialization — creates the complete monorepo structure with all services, docker-compose, CI/CD pipeline, environment config, and documentation scaffolds. The FIRST command to run on a brand new project."
argument-hint: "<project-name>"
---

## Mission
Create the complete project structure from scratch.

## What Gets Created
```
[project-name]/
├── services/
│   ├── api-gateway/          → NestJS API Gateway (scaffolded)
│   ├── core-service/         → NestJS Core Service (scaffolded)
│   ├── ai-service/           → Python/Django AI Service (scaffolded)
│   └── shared/               → Proto/schema definitions
├── apps/
│   ├── web/                  → Next.js React App (scaffolded)
│   ├── mobile-flutter/       → Flutter App (scaffolded)
│   └── mobile-kmp/           → KMP App (scaffolded)
├── infrastructure/
│   ├── docker/               → Service Dockerfiles
│   ├── terraform/            → AWS Terraform modules
│   └── k8s/                  → Kubernetes manifests
├── docs/                     → Documentation templates
├── .github/workflows/        → CI/CD pipeline
├── docker-compose.yml        → Local development
├── .env.example              → Environment template
├── .gitignore                → Comprehensive gitignore
├── CLAUDE.md                 → Agent instructions
├── PRD.md                    → Empty PRD template
├── feature_list.json         → Empty feature list
└── README.md                 → Project README
```

## Steps
1. Create all directories
2. Scaffold each service with boilerplate (using setup-service per service)
3. Create docker-compose.yml with all services
4. Create GitHub Actions CI pipeline
5. Create .env.example with all variables
6. Copy CLAUDE.md, steering docs from plugin
7. Initialize git + initial commit
8. Report: "Project initialized. Run `docker-compose up` to start."

## Agents Used
- system-architect → determines folder structure
- devops-engineer → creates Docker + CI + infrastructure
- backend-developer → scaffolds NestJS services
- python-developer → scaffolds Django service
- frontend-developer → scaffolds React + Flutter + KMP
- technical-writer → creates README + docs templates
