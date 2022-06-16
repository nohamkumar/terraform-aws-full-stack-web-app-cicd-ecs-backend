module "cdn_cloudfront_s3" {
  source      = "git@github.com:nohamkumar/terraform-aws-cloudfront-s3-cdn.git"
  namespace   = var.namespace
  environment = var.environment

  parent_zone_name     = data.terraform_remote_state.common.outputs.tf_sg_xyz_hosted_zone_domain
  aliases              = var.aliases
  dns_alias_enabled    = true
  acm_certificate_arn  = data.terraform_remote_state.common.outputs.tf_sg_xyz_ssl_arn
  cors_allowed_methods = ["GET", "HEAD", "PUT"]
  cors_allowed_origins = ["*.${data.terraform_remote_state.common.outputs.tf_sg_xyz_hosted_zone_domain}"]

  versioning_enabled                = false
  origin_force_destroy              = false
  cloudfront_access_logging_enabled = true
  cloudfront_access_log_prefix      = "cf-access-logs"
}
