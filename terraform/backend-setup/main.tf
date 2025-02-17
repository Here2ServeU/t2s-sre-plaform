# Terraform Provider Configuration
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = var.s3_backend_bucket
    key            = "terraform/${var.environment}/state"
    region         = var.aws_region
    encrypt        = true
    dynamodb_table = var.dynamodb_table
  }
}

provider "aws" {
  region = var.aws_region
}

# Terraform Remote State Locking with DynamoDB
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# S3 Bucket for Terraform Backend
resource "aws_s3_bucket" "terraform_backend" {
  bucket = var.s3_backend_bucket
  acl    = var.s3_bucket_acl
  versioning {
    enabled = var.s3_versioning
  }
  lifecycle_rule {
    id      = var.s3_lifecycle_rule_id
    enabled = var.s3_lifecycle_enabled
    transition {
      days          = var.s3_transition_days
      storage_class = var.s3_storage_class
    }
  }
}
