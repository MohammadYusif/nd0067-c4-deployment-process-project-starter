#!/bin/bash

# Set environment variables on Elastic Beanstalk
eb setenv POSTGRES_USERNAME=$POSTGRES_USERNAME POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_HOST=$POSTGRES_HOST POSTGRES_DB=$POSTGRES_DB AWS_BUCKET=$AWS_BUCKET AWS_REGION=$AWS_REGION JWT_SECRET=$JWT_SECRET URL=$URL --environment udagram-api-dev

# Deploy to Elastic Beanstalk
eb deploy udagram-api-dev
