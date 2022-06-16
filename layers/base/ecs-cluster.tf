module "ecs-cluster" {
  source      = "git@github.com:nohamkumar/aws-ecs-cluster.git"
  namespace   = var.namespace
  environment = var.environment
}
