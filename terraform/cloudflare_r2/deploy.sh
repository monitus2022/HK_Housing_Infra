]#!/bin/bash

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
if [ -z "$TF_VAR_cloudflare_api_token" ]; then
    echo "Error: TF_VAR_cloudflare_api_token environment variable is not set."
    exit 1
fi

if [ -z "$TF_VAR_cloudflare_account_id" ]; then
    echo "Error: TF_VAR_cloudflare_account_id environment variable is not set."
    exit 1
fi

if [ -z "$TF_VAR_cloudflare_bucket_name" ]; then
    echo "Error: TF_VAR_cloudflare_bucket_name environment variable is not set."
    exit 1
fi

echo "Initializing Terraform..."
terraform init

echo "Planning deployment..."
terraform plan

echo "Applying configuration..."
terraform apply -auto-approve

echo "Deployment completed successfully!"