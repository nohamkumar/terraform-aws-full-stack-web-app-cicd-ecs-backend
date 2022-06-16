module "alb" {

  source    = "git@github.com:nohamkumar/aws-alb-for-ecs.git"
  namespace = var.namespace
  vpc_id    = module.network.vpc_id
  subnets   = module.network.public_subnet_ids

  target_group_port       = 80
  default_certificate_arn = data.terraform_remote_state.common.outputs.tf_sg_xyz_ssl_arn
  http_listener_enabled   = true
}
