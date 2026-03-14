---
description: "Deploy all microservices to AWS. Runs pre-deploy checks, builds Docker images, pushes to ECR, deploys to ECS, and runs smoke tests."
argument-hint: "<environment: staging | production>"
---

## Mission
Deploy the entire microservice stack to the specified AWS environment.

## Pre-Deploy Checks (MUST ALL PASS)
1. All tests passing (/run-tests)
2. No critical security findings
3. Database migrations tested
4. Docker images build successfully
5. If production: REQUIRE USER APPROVAL

## Deploy Sequence
```
1. Run database migrations
   - services/core-service: npx prisma migrate deploy
   - services/ai-service: python manage.py migrate

2. Build & push Docker images
   - docker build -t core-service services/core-service
   - docker build -t ai-service services/ai-service
   - docker build -t api-gateway services/api-gateway
   - Push all to ECR

3. Deploy services (order matters)
   - AI Service → Core Service → API Gateway

4. Deploy frontend
   - Build: cd apps/web && npm run build
   - Upload to S3 + CloudFront invalidation

5. Smoke tests
   - Health check: GET /health on each service
   - Basic API test: login + fetch data

6. Monitor for 15 minutes
   - Watch error rate (auto-rollback if > 1%)
```
