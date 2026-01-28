# Infrastructure Description

## Overview

The Udagram application is deployed using Amazon Web Services (AWS) with a three-tier architecture consisting of a frontend, backend API, and database.

## AWS Services Used

### 1. AWS RDS (Relational Database Service)

- **Purpose**: Hosts the PostgreSQL database for storing application data
- **Engine**: PostgreSQL 12+
- **Instance Type**: db.t3.micro (Free Tier eligible)
- **Endpoint**: `udagram-db.ceqeklx3qssj.us-east-1.rds.amazonaws.com`
- **Configuration**:
  - Database name: `postgres`
  - Port: 5432
  - Public accessibility: Enabled (for development)
- **Security**: VPC Security Group allows inbound traffic on port 5432

### 2. AWS Elastic Beanstalk

- **Purpose**: Hosts and manages the Node.js backend API
- **Platform**: Node.js 20 running on 64bit Amazon Linux 2023
- **Environment Type**: Single instance (for development)
- **Environment URL**: `udagram-api-dev.eba-3bfwuymm.us-east-1.elasticbeanstalk.com`
- **Instance Type**: t2.micro
- **Features**:
  - Automatic scaling capabilities
  - Health monitoring
  - Easy deployment via EB CLI
  - Environment variable management
- **Deployment**: Archive.zip containing compiled TypeScript code

### 3. AWS S3 (Simple Storage Service)

- **Purpose**: Hosts the static frontend application (Angular/Ionic)
- **Bucket Name**: `udagram-frontend-368047729698`
- **Website URL**: `http://udagram-frontend-368047729698.s3-website-us-east-1.amazonaws.com`
- **Configuration**:
  - Static website hosting enabled
  - Public read access for web content
  - Index document: index.html
  - Error document: index.html (for SPA routing)
- **Bucket Policy**: Allows public read access to all objects

## Infrastructure Diagram

```
                                    ┌─────────────────────┐
                                    │      Internet       │
                                    └──────────┬──────────┘
                                               │
                    ┌──────────────────────────┼──────────────────────────┐
                    │                          │                          │
                    ▼                          ▼                          ▼
        ┌───────────────────┐      ┌───────────────────┐      ┌───────────────────┐
        │    AWS S3         │      │ Elastic Beanstalk │      │    AWS RDS        │
        │  (Frontend)       │      │    (Backend API)  │      │  (PostgreSQL)     │
        │                   │      │                   │      │                   │
        │ - Static hosting  │      │ - Node.js 14      │      │ - PostgreSQL 12+  │
        │ - Angular/Ionic   │──────│ - Express API     │──────│ - Port 5432       │
        │ - Public access   │      │ - Auto-scaling    │      │ - Persistent data │
        └───────────────────┘      └───────────────────┘      └───────────────────┘
```

## Environment Variables

The following environment variables are configured in Elastic Beanstalk:

| Variable | Description |
|----------|-------------|
| POSTGRES_HOST | RDS database endpoint |
| POSTGRES_DB | Database name |
| POSTGRES_USERNAME | Database username |
| POSTGRES_PASSWORD | Database password |
| AWS_BUCKET | S3 bucket ARN for media storage |
| AWS_REGION | AWS region (us-east-1) |
| JWT_SECRET | Secret key for JWT token signing |
| URL | Frontend application URL |

## Security Considerations

1. **Database**: RDS instance is within a VPC with security group rules limiting access
2. **API**: Elastic Beanstalk environment manages security and scaling
3. **Frontend**: S3 bucket is configured for public read access (web hosting)
4. **Secrets**: All sensitive data stored as environment variables, not in code
