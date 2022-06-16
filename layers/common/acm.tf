module "acm-tf-sg-xyz" {
  source                            = "git@github.com:nohamkumar/terraform-aws-acm-request-certificate.git"
  domain_name                       = var.domain
  zone_id                           = aws_route53_zone.tf-sg-xyz.zone_id
  process_domain_validation_options = true
  ttl                               = "300"
  subject_alternative_names         = ["*.${var.domain}"]
  zone_name                         = aws_route53_zone.tf-sg-xyz.name

  tags = {
    namespace = var.namespace
    domain    = var.domain
  }
}
