# Variables for Terraform Remote State Locking and Backend Storage

variable "aws_region" {
  description = "AWS Region where the infrastructure will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "dynamodb_table" {
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
  default     = "terraform-state-lock"
}

variable "s3_backend_bucket" {
  description = "Name of the S3 bucket for Terraform state storage"
  type        = string
  default     = "t2s-terraform-state"
}

variable "s3_bucket_acl" {
  description = "ACL policy for the S3 bucket"
  type        = string
  default     = "private"
}

variable "s3_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "s3_lifecycle_rule_id" {
  description = "ID for the S3 lifecycle rule"
  type        = string
  default     = "statefile"
}

variable "s3_lifecycle_enabled" {
  description = "Enable lifecycle rule for transitioning objects"
  type        = bool
  default     = true
}

variable "s3_transition_days" {
  description = "Number of days before transitioning objects to Glacier storage"
  type        = number
  default     = 30
}

variable "s3_storage_class" {
  description = "Storage class for transitioned objects"
  type        = string
  default     = "GLACIER"
}
