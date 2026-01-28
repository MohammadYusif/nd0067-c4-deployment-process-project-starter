# Pipeline Description

## Overview

The Udagram application uses CircleCI for Continuous Integration and Continuous Deployment (CI/CD). The pipeline automatically builds, tests, and deploys the application when code is pushed to the repository.

## Pipeline Workflow

The pipeline consists of three main stages:

### 1. Build Stage

**Trigger**: Automatically runs on every push to any branch

**Steps**:
1. **Install Node.js**: Sets up Node.js v14.15 environment
2. **Checkout Code**: Pulls the latest code from the repository
3. **Install Frontend Dependencies**: Runs `npm run frontend:install`
   - Installs Angular/Ionic dependencies with force flag
4. **Install API Dependencies**: Runs `npm run api:install`
   - Installs Node.js backend dependencies
5. **Lint Frontend**: Runs `npm run frontend:lint`
   - Checks code quality and style compliance
6. **Build Frontend**: Runs `npm run frontend:build`
   - Compiles Angular application to static files
7. **Build API**: Runs `npm run api:build`
   - Compiles TypeScript to JavaScript
   - Creates deployment archive

### 2. Hold Stage (Manual Approval)

**Trigger**: After successful build on the `master` branch only

**Purpose**:
- Provides a manual gate before deployment
- Allows review of changes before production deployment
- Prevents accidental deployments

**Action Required**: A team member must approve the deployment in CircleCI

### 3. Deploy Stage

**Trigger**: After manual approval in the Hold stage

**Steps**:
1. **Install Node.js**: Sets up Node.js v14.15 environment
2. **Setup Elastic Beanstalk CLI**: Configures EB CLI for deployment
3. **Setup AWS CLI**: Configures AWS credentials
4. **Checkout Code**: Pulls the latest code
5. **Deploy Application**: Runs `npm run deploy`
   - Deploys backend to Elastic Beanstalk
   - Deploys frontend to S3 bucket

## Pipeline Diagram

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           CircleCI Pipeline                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│   ┌─────────────┐      ┌─────────────┐      ┌─────────────────────────┐    │
│   │             │      │             │      │                         │    │
│   │    BUILD    │─────▶│    HOLD     │─────▶│        DEPLOY          │    │
│   │             │      │  (Approval) │      │                         │    │
│   └─────────────┘      └─────────────┘      └─────────────────────────┘    │
│         │                    │                          │                   │
│         │                    │                          │                   │
│   ┌─────┴─────┐        ┌─────┴─────┐            ┌───────┴───────┐          │
│   │           │        │           │            │               │          │
│   │ - Install │        │ - Manual  │            │ - Install     │          │
│   │   deps    │        │   gate    │            │   Node/CLI    │          │
│   │ - Lint    │        │ - Review  │            │ - Deploy API  │          │
│   │ - Build   │        │   changes │            │   to EB       │          │
│   │                    │           │            │ - Deploy FE   │          │
│   │           │        │           │            │   to S3       │          │
│   └───────────┘        └───────────┘            └───────────────┘          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Environment Variables in CircleCI

The following environment variables must be configured in CircleCI project settings:

| Variable | Description |
|----------|-------------|
| AWS_ACCESS_KEY_ID | AWS IAM user access key |
| AWS_SECRET_ACCESS_KEY | AWS IAM user secret key |
| AWS_DEFAULT_REGION | AWS region (us-east-1) |
| POSTGRES_HOST | RDS database endpoint |
| POSTGRES_DB | Database name |
| POSTGRES_USERNAME | Database username |
| POSTGRES_PASSWORD | Database password |
| AWS_BUCKET | S3 bucket ARN |
| JWT_SECRET | JWT signing secret |

## Orbs Used

The pipeline uses the following CircleCI orbs:

1. **circleci/node@5.0.2**: Node.js installation and caching
2. **circleci/aws-elastic-beanstalk@2.0.1**: Elastic Beanstalk deployment
3. **circleci/aws-cli@3.1.1**: AWS CLI setup and configuration

## Branch Strategy

- **All branches**: Build and lint only
- **master branch**: Full pipeline including deployment (after approval)
