terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token
}

variable "api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "bucket_name" {
  description = "Name of the R2 bucket"
  type        = string
  default     = "my-r2-bucket"
}

resource "cloudflare_r2_bucket" "cloudflare-bucket" {
  account_id = var.account_id
  name       = var.bucket_name
  location   = "APAC"
}

