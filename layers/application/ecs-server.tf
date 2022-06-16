
module "server-container" {
  namespace = var.namespace
  source    = "git@github.com:nohamkumar/aws-ecs-container-definition.git"

  container_name  = "server"
  container_image = data.terraform_remote_state.base.outputs.nodejs_ecr_repository_url
  essential       = true

  port_mappings = [
    {
      "containerPort" = var.container_port
      "protocol"      = "tcp"
    }
  ]

  cd_awslogs_region = var.main_region
}



module "ecs-td-service" {
  source      = "git@github.com:nohamkumar/aws-ecs-task-definition-service.git"
  namespace   = var.namespace
  environment = var.environment

  #td
  task_cpu              = var.task_cpu
  task_memory           = var.task_memory
  container_definitions = module.server-container.cd_json

  #service
  ecs_service_name    = "server"
  cluster_id          = data.terraform_remote_state.base.outputs.nodejs_ecs_cluster_id
  lb_target_group_arn = data.terraform_remote_state.base.outputs.alb_target_group_arn
  subnets             = data.terraform_remote_state.base.outputs.public_subnet_ids
  container_port      = var.container_port
  container_name      = "server"

  vpc_id                   = data.terraform_remote_state.base.outputs.vpc_id
  ecs_lb_security_group_id = data.terraform_remote_state.base.outputs.ecs_lb_security_group_id
}
