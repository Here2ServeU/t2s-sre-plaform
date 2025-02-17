# terraform.tfvars - Terraform Variables for Remote State Locking and Backend Storage

aws_region           = "us-east-1"
dynamodb_table       = "terraform-state-lock"
s3_backend_bucket    = "t2s-terraform-state"
s3_bucket_acl        = "private"
s3_versioning        = true
s3_lifecycle_rule_id = "statefile"
s3_lifecycle_enabled = true
s3_transition_days   = 30
s3_storage_class     = "GLACIER"
