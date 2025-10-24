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

data "cloudflare_r2_bucket" "existing" {
  account_id = var.cloudflare_account_id
  name       = var.cloudflare_bucket_name
}

resource "cloudflare_r2_bucket" "cloudflare-bucket" {
  count      = data.cloudflare_r2_bucket.existing.id == "" ? 1 : 0
  account_id = var.cloudflare_account_id
  name       = var.cloudflare_bucket_name
  location   = "APAC"
}

