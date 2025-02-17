# variables.tf - Terraform Variables for Remote State Locking and Backend Storage

variable "aws_region" {
  description = "AWS Region where the infrastructure will be deployed"
  type        = string
}

variable "dynamodb_table" {
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
}

variable "s3_backend_bucket" {
  description = "Name of the S3 bucket for Terraform state storage"
  type        = string
}

variable "s3_bucket_acl" {
  description = "ACL policy for the S3 bucket"
  type        = string
}

variable "s3_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
}

variable "s3_lifecycle_rule_id" {
  description = "ID for the S3 lifecycle rule"
  type        = string
}

variable "s3_lifecycle_enabled" {
  description = "Enable lifecycle rule for transitioning objects"
  type        = bool
}

variable "s3_transition_days" {
  description = "Number of days before transitioning objects to Glacier storage"
  type        = number
}

variable "s3_storage_class" {
  description = "Storage class for transitioned objects"
  type        = string
}

