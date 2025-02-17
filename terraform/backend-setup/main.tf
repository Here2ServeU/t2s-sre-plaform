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
  acl    = "private"
  versioning {
    enabled = true
  }
  lifecycle_rule {
    id      = "statefile"
    enabled = true
    transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }
}
