#----
#NETWORK
#----
#------------------
### VPC OUTPUTS
#------------------

output "vpc_id" {
  value       = module.network.vpc_id
  description = "The ID of the VPC"
}

output "igw_id" {
  value       = module.network.igw_id
  description = "IGW ID"
}
#------------------
### SUBNET OUTPUTS
#------------------

output "public_subnet_ids" {
  description = "List of the created public subnets IDs"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of the created private subnets IDs"
  value       = module.network.private_subnet_ids
}

output "ngw_id" {
  value       = module.network.ngw_id
  description = "NAT Gateway ID"
}
#----

output "nodejs_ecs_cluster_id" {
  description = "ECS cluster ID"
  value       = module.ecs-cluster.ecs_cluster_id
}

output "nodejs_ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.application_repository.repository_url
}

#----
#ALB
#----

output "alb_id" {
  description = "ALB ID"
  value       = module.alb.alb_id
}

output "alb_arn" {
  description = "ALB ARN"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  description = "LB DNS name"
  value       = module.alb.alb_dns_name
}

output "alb_zone_id" {
  description = "LB zone ID"
  value       = module.alb.alb_zone_id
}

output "alb_target_group_arn" {
  description = "Target Group ARN"
  value       = module.alb.alb_target_group_arn
}

#-----
#SECURITY GROUPS
#-----

output "ecs_lb_security_group_id" {
  description = "ID of Security Group attached to ECS ALB."
  value       = module.alb.ecs_lb_security_group_id
}
