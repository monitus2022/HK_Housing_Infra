# Terraform Cloudflare R2 Bucket Setup

This directory contains Terraform configuration to create a Cloudflare R2 object storage bucket.

## Prerequisites

- Terraform installed (version 1.0+)
- Cloudflare account with R2 enabled
- API token with R2 permissions

## Quick Start

1. Copy `.env.example` to `.env` and fill in your values.
2. Run `./deploy.sh` to deploy the bucket.

## GitHub Actions

Set `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID` as repository secrets. Run `./deploy.sh` in your workflow.

## Notes

- If a bucket exists, Terraform may adopt it or error. Use `terraform import` for existing buckets.