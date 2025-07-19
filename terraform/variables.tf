# Terraform Variables File

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, stage, prod)"
  type        = string
}

variable "instance_class" {
  description = "EC2 Instance Class"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private Subnet CIDRs"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public Subnet CIDRs"
  type        = list(string)
}

variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "eks_version" {
  description = "EKS Kubernetes Version"
  type        = string
}

variable "rds_instance_name" {
  description = "RDS Instance Name"
  type        = string
}

variable "rds_username" {
  description = "RDS Username"
  type        = string
}

variable "rds_password" {
  description = "RDS Password"
  type        = string
  sensitive   = true
}

variable "s3_bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "s3_backend_bucket" {
  description = "S3 Bucket for Terraform State"
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB Table for Terraform State Lock"
  type        = string
}