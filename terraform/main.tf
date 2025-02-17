# Terraform Provider Configuration
provider "aws" {
  region = var.aws_region
}

# Backend Configuration for Terraform State
terraform {
  backend "s3" {
    bucket         = var.s3_backend_bucket
    key            = "terraform/${terraform.workspace}/state"
    region         = var.aws_region
    encrypt        = true
  }
}

# Define Workspaces for Environments
resource "terraform_workspace" "current" {}

locals {
  environment = terraform.workspace
}

# VPC Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"

  name            = "t2s-vpc-${local.environment}"
  cidr            = var.vpc_cidr
  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  enable_nat_gateway = true
}

# EKS Cluster Module
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "t2s-eks-${local.environment}"
  cluster_version = var.eks_version
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
}

# Application Load Balancer
module "alb" {
  source             = "terraform-aws-modules/alb/aws"
  name               = "t2s-alb-${local.environment}"
  load_balancer_type = "application"
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets
}

# RDS PostgreSQL Database
module "rds" {
  source          = "terraform-aws-modules/rds/aws"
  identifier      = "t2s-rds-${local.environment}"
  engine          = "postgres"
  engine_version  = "14"
  instance_class  = "db.t3.micro"
  allocated_storage = 20
  username        = var.rds_username
  password        = var.rds_password
  vpc_security_group_ids = [module.security_group.security_group_id]
  publicly_accessible = false
}

# S3 Bucket for Frontend Assets
module "s3" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket  = "t2s-frontend-assets-${local.environment}"
  acl     = "private"
}

# Security Groups
module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  name    = "t2s-security-group-${local.environment}"
  vpc_id  = module.vpc.vpc_id
}
