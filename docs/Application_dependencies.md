# Application Dependencies

## Overview

The Udagram application consists of two main components: a backend API and a frontend web application. Each has its own set of dependencies.

## Backend API (udagram-api)

### Runtime Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| aws-sdk | ^2.429.0 | AWS services integration (S3) |
| bcryptjs | 2.4.3 | Password hashing |
| body-parser | ^1.18.3 | Request body parsing |
| cors | ^2.8.5 | Cross-Origin Resource Sharing |
| dotenv | ^8.2.0 | Environment variable management |
| email-validator | ^2.0.4 | Email format validation |
| express | ^4.16.4 | Web application framework |
| jsonwebtoken | ^8.5.1 | JWT authentication |
| pg | ^8.7.1 | PostgreSQL client |
| reflect-metadata | ^0.1.13 | Decorator metadata |
| sequelize | ^6.26.0 | ORM for database operations |
| sequelize-typescript | ^2.1.5 | TypeScript support for Sequelize |

### Development Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| @types/* | Various | TypeScript type definitions |
| @typescript-eslint/* | ^2.19.2 | ESLint TypeScript support |
| chai | ^4.2.0 | Testing assertions |
| chai-http | ^4.2.1 | HTTP testing |
| eslint | ^6.8.0 | Code linting |
| mocha | ^6.1.4 | Test framework |
| ts-node-dev | ^1.0.0-pre.32 | TypeScript development server |
| typescript | ^4.2.3 | TypeScript compiler |

### Node.js Version

- **Required**: Node.js 14.15.0
- **NPM**: 6.14.x to 7.19.x

## Frontend (udagram-frontend)

### Runtime Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| @angular/common | ^8.2.14 | Angular common utilities |
| @angular/core | ^8.2.14 | Angular core framework |
| @angular/forms | ^8.2.14 | Angular forms module |
| @angular/http | ^7.2.16 | HTTP client (deprecated) |
| @angular/platform-browser | ^8.2.14 | Browser platform |
| @angular/platform-browser-dynamic | ^8.2.14 | Dynamic browser platform |
| @angular/router | ^8.2.14 | Angular routing |
| @ionic-native/core | ^5.0.0 | Ionic Native core |
| @ionic-native/splash-screen | ^5.0.0 | Splash screen plugin |
| @ionic-native/status-bar | ^5.0.0 | Status bar plugin |
| @ionic/angular | ^4.1.0 | Ionic Angular integration |
| core-js | ^2.5.4 | JavaScript polyfills |
| rxjs | ~6.5.4 | Reactive Extensions |
| zone.js | ~0.9.1 | Zone.js for Angular |

### Development Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| @angular-devkit/* | Various | Angular CLI tools |
| @angular/cli | ~8.3.25 | Angular CLI |
| @angular/compiler | ~8.2.14 | Angular compiler |
| @angular/compiler-cli | ~8.2.14 | Ahead-of-time compiler |
| @ionic/angular-toolkit | ~1.4.0 | Ionic Angular schematics |
| jasmine-core | ~2.99.1 | Testing framework |
| karma | ~3.1.4 | Test runner |
| protractor | ~5.4.0 | E2E testing |
| typescript | ^3.5.3 | TypeScript compiler |

## External Services

### AWS Services

| Service | Purpose |
|---------|---------|
| AWS RDS | PostgreSQL database hosting |
| AWS Elastic Beanstalk | Backend API hosting |
| AWS S3 | Frontend static file hosting |

### CI/CD

| Service | Purpose |
|---------|---------|
| CircleCI | Continuous Integration and Deployment |
| GitHub | Source code repository |

## Dependency Management

### Package Installation

**Backend:**
```bash
cd udagram/udagram-api
npm install
```

**Frontend:**
```bash
cd udagram/udagram-frontend
npm install -f  # Force flag required due to peer dependency conflicts
```

### Known Issues

1. **Frontend peer dependencies**: The frontend uses Angular 8 with some conflicting peer dependencies. Use `npm install -f` to force installation.

2. **fsevents warning**: On Windows, you may see warnings about `fsevents` which is a macOS-only package. This can be safely ignored.

3. **Node version**: Ensure you're using Node.js 14.x. Higher versions may cause compatibility issues.

## Updating Dependencies

When updating dependencies:

1. Test locally before committing
2. Avoid using `npm audit fix` as it may break compatibility
3. Update one dependency at a time
4. Run full build and test suite after updates
