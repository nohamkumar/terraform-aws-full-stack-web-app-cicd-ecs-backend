module "cicd-ecs" {
  source      = "git@github.com:nohamkumar/aws-codepipeline-cicd.git"
  namespace   = var.namespace
  environment = var.environment
  attributes  = var.cicd_ecs_name_attributes

  github_repository = var.nodejs_github_repository
  github_branch     = var.nodejs_github_branch
  deploy_provider   = "ECS"
  buildspec_path    = "./buildspec/${var.environment}/server/buildspec.yml"

  deploy_config = {
    ClusterName = data.terraform_remote_state.base.outputs.nodejs_ecs_cluster_id
    ServiceName = module.ecs-td-service.ecs_serivce_name
  }
}


