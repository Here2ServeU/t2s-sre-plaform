# Outputs
output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks.cluster_id
}

output "alb_dns_name" {
  description = "ALB DNS Name"
  value       = module.alb.lb_dns_name
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = module.rds.db_instance_endpoint
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = module.s3.s3_bucket_id
}
