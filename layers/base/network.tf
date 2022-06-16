module "network" {
  source      = "git@github.com:nohamkumar/aws-vpc-subnet.git"
  cidr_block  = "10.0.0.0/16"
  namespace   = var.namespace
  environment = var.environment
}
