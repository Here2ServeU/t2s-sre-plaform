# Terraform Variables File

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "instance_class" {
  description = "EC2 Instance Class"
  type        = string
  default     = "t3.micro"
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  description = "Private Subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "Public Subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "t2s-eks-dev"
}

variable "eks_version" {
  description = "EKS Kubernetes Version"
  type        = string
  default     = "1.27"
}

variable "rds_instance_name" {
  description = "RDS Instance Name"
  type        = string
  default     = "t2s-rds-dev"
}

variable "rds_username" {
  description = "RDS Username"
  type        = string
  default     = "admin"
}

variable "rds_password" {
  description = "RDS Password"
  type        = string
  sensitive   = true
}

variable "s3_bucket_name" {
  description = "S3 Bucket Name"
  type        = string
  default     = "t2s-frontend-assets-dev"
}

variable "s3_backend_bucket" {
  description = "S3 Bucket for Terraform State"
  type        = string
  default     = "t2s-terraform-state"
}
