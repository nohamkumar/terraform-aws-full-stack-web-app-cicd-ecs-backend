resource "aws_route53_zone" "tf-sg-xyz" {
  name = var.domain

  tags = {
    namespace = var.namespace
    Domain    = var.domain
  }
}
