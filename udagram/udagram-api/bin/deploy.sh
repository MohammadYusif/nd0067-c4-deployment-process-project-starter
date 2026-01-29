#!/bin/bash

# Set environment variables on Elastic Beanstalk
eb setenv POSTGRES_USERNAME=$POSTGRES_USERNAME POSTGRES_PASSWORD=$POSTGRES_PASSWORD POSTGRES_HOST=$POSTGRES_HOST POSTGRES_DB=$POSTGRES_DB AWS_BUCKET=$AWS_BUCKET AWS_REGION=$AWS_REGION JWT_SECRET=$JWT_SECRET URL=$URL --environment udagram-api-dev

# Deploy the built archive from www folder
cd www
eb deploy udagram-api-dev --staged
cd ..
