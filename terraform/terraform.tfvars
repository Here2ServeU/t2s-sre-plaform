# Terraform tfvars file for different environments

# Development Environment

aws_region         = "us-east-1"
environment        = "dev"
instance_class     = "t3.micro"
vpc_cidr          = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets     = ["10.0.3.0/24", "10.0.4.0/24"]
eks_cluster_name   = "t2s-eks-dev"
eks_version        = "1.27"
rds_instance_name  = "t2s-rds-dev"
rds_username       = "admin"
rds_password       = "securepassword"
s3_bucket_name     = "t2s-frontend-assets-dev"
s3_backend_bucket  = "t2s-terraform-state-dev"

dynamodb_table = "terraform-state-lock"

# Staging Environment

aws_region         = "us-east-1"
environment        = "stage"
instance_class     = "t3.medium"
vpc_cidr          = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
private_subnets    = ["10.0.5.0/24", "10.0.6.0/24"]
public_subnets     = ["10.0.7.0/24", "10.0.8.0/24"]
eks_cluster_name   = "t2s-eks-stage"
eks_version        = "1.27"
rds_instance_name  = "t2s-rds-stage"
rds_username       = "admin"
rds_password       = "securepassword"
s3_bucket_name     = "t2s-frontend-assets-stage"
s3_backend_bucket  = "t2s-terraform-state-stage"

dynamodb_table = "terraform-state-lock"

# Production Environment

aws_region         = "us-east-1"
environment        = "prod"
instance_class     = "t3.large"
vpc_cidr          = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets    = ["10.0.9.0/24", "10.0.10.0/24", "10.0.11.0/24"]
public_subnets     = ["10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24"]
eks_cluster_name   = "t2s-eks-prod"
eks_version        = "1.27"
rds_instance_name  = "t2s-rds-prod"
rds_username       = "admin"
rds_password       = "securepassword"
s3_bucket_name     = "t2s-frontend-assets-prod"
s3_backend_bucket  = "t2s-terraform-state-prod"

dynamodb_table = "terraform-state-lock"
