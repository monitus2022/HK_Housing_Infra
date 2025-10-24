terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
  # Can be set via environment variable TF_VAR_cloudflare_api_token
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
  type        = string
  # Can be set via environment variable TF_VAR_cloudflare_account_id
}

variable "cloudflare_bucket_name" {
  description = "Name of the R2 bucket"
  type        = string
  default     = "my-r2-bucket"
}

resource "cloudflare_r2_bucket" "cloudflare-bucket" {
  account_id = var.cloudflare_account_id
  name       = var.cloudflare_bucket_name
  location   = "APAC"
}

# Import existing bucket if it exists
# Run: terraform import cloudflare_r2_bucket.cloudflare-bucket <account_id>/<bucket_name>

