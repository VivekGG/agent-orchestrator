---
description: "Generate TypeScript/Dart types from the API spec — keeps frontend and mobile types in sync with the backend API contract."
---

## Mission
Generate typed API clients from the OpenAPI spec.

## Steps
1. Find API spec: docs/api-spec.yaml or auto-generate from NestJS Swagger
2. Generate TypeScript types: `npx openapi-typescript docs/api-spec.yaml -o apps/web/src/types/api.ts`
3. Generate Dart types for Flutter (if using openapi_generator)
4. Verify generated types compile without errors
5. Report any breaking changes from previous generation
