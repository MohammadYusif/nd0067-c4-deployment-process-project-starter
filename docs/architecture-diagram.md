# Architecture Diagram

## High-Level Infrastructure Overview

```
┌─────────────────────────────────────────────────────────────────────────────────────┐
│                                    USERS                                             │
│                                      │                                               │
│                                      ▼                                               │
│                              ┌───────────────┐                                       │
│                              │   Internet    │                                       │
│                              └───────┬───────┘                                       │
│                                      │                                               │
└──────────────────────────────────────┼──────────────────────────────────────────────┘
                                       │
                    ┌──────────────────┴──────────────────┐
                    │                                     │
                    ▼                                     ▼
┌───────────────────────────────────┐   ┌───────────────────────────────────┐
│           AWS S3                  │   │      AWS Elastic Beanstalk        │
│     (Frontend Hosting)            │   │         (Backend API)             │
├───────────────────────────────────┤   ├───────────────────────────────────┤
│                                   │   │                                   │
│  ┌─────────────────────────────┐  │   │  ┌─────────────────────────────┐  │
│  │                             │  │   │  │                             │  │
│  │   Angular/Ionic App         │  │   │  │   Node.js Express API       │  │
│  │                             │  │   │  │                             │  │
│  │   - Static HTML/CSS/JS      │  │   │  │   - RESTful endpoints       │  │
│  │   - index.html              │  │   │  │   - Authentication          │  │
│  │   - /www folder contents    │◀─┼───┼──│   - Image processing        │  │
│  │                             │  │   │  │   - Database operations     │  │
│  │   URL: s3-bucket.s3-        │  │   │  │                             │  │
│  │   website.amazonaws.com     │  │   │  │   URL: udagram-api-dev.     │  │
│  │                             │  │   │  │   elasticbeanstalk.com      │  │
│  └─────────────────────────────┘  │   │  └──────────────┬──────────────┘  │
│                                   │   │                 │                 │
└───────────────────────────────────┘   └─────────────────┼─────────────────┘
                                                          │
                                                          │ Port 5432
                                                          ▼
                                        ┌───────────────────────────────────┐
                                        │            AWS RDS                │
                                        │        (PostgreSQL DB)            │
                                        ├───────────────────────────────────┤
                                        │                                   │
                                        │  ┌─────────────────────────────┐  │
                                        │  │                             │  │
                                        │  │   PostgreSQL 12+            │  │
                                        │  │                             │  │
                                        │  │   - Users table             │  │
                                        │  │   - FeedItems table         │  │
                                        │  │                             │  │
                                        │  │   Endpoint: udagram-db.     │  │
                                        │  │   xxxxx.rds.amazonaws.com   │  │
                                        │  │                             │  │
                                        │  └─────────────────────────────┘  │
                                        │                                   │
                                        └───────────────────────────────────┘
```

## Data Flow

1. **User Request**: User accesses the application via browser
2. **Frontend**: S3 serves the Angular/Ionic static files
3. **API Calls**: Frontend makes HTTP requests to the Elastic Beanstalk API
4. **Database**: API communicates with RDS PostgreSQL for data persistence
5. **Response**: Data flows back through the same path to the user

## Creating an Image Diagram

For submission, create an image diagram using one of these tools:

- **draw.io** (diagrams.net) - Free, web-based
- **Lucidchart** - Free tier available
- **AWS Architecture Icons** - Official AWS icons for diagrams

Save the diagram as PNG or PDF in the `docs/screenshots/` folder.
