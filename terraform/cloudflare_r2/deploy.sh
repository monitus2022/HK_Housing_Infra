#!/bin/bash

set -e

echo "Starting Cloudflare R2 bucket deployment..."

# Check if .env file exists and load it
if [ -f .env ]; then
    echo "Loading environment variables from .env file..."
    export $(grep -v '^#' .env | xargs)
else
    echo "No .env file found."
fi

# Check for required environment variables
if [ -z "$CLOUDFLARE_API_TOKEN" ]; then
    echo "Error: CLOUDFLARE_API_TOKEN environment variable is not set."
    exit 1
fi

if [ -z "$CLOUDFLARE_ACCOUNT_ID" ]; then
    echo "Error: CLOUDFLARE_ACCOUNT_ID environment variable is not set."
    exit 1
fi

if [ -z "$TF_VAR_bucket_name" ]; then
    echo "Error: TF_VAR_bucket_name environment variable is not set."
    exit 1
fi

echo "Initializing Terraform..."
terraform init

echo "Planning deployment..."
terraform plan

echo "Applying configuration..."
terraform apply -auto-approve

echo "Deployment completed successfully!"