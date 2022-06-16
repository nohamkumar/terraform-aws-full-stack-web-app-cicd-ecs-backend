output "tf_sg_xyz_hosted_zone_id" {
  description = "Hosted Zone ID"
  value       = aws_route53_zone.tf-sg-xyz.zone_id
}

output "tf_sg_xyz_ssl_arn" {
  description = "wildcard ACM certificate ARN of *.hostedzone"
  value       = module.acm-tf-sg-xyz.arn
}

output "tf_sg_xyz_hosted_zone_domain" {
  description = "Hosted Zone Domain name"
  value       = aws_route53_zone.tf-sg-xyz.name
}
