#---
#RDS
#---

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "&$"
}

resource "aws_ssm_parameter" "db_name" {
  name        = "/${var.namespace}-${var.environment}/postgresql/db_name"
  description = "PostgreSQL DB name"
  type        = "SecureString"
  value       = module.rds_cluster.database_name

  tags = {
    namespace   = var.namespace
    environment = var.environment
  }
}

resource "aws_ssm_parameter" "db_endpoint" {
  name        = "/${var.namespace}-${var.environment}/postgresql/db_endpoint"
  description = "PostgreSQL DB writer endpoint"
  type        = "SecureString"
  value       = module.rds_cluster.endpoint

  tags = {
    namespace   = var.namespace
    environment = var.environment
  }
}


resource "aws_ssm_parameter" "db_username" {
  name        = "/${var.namespace}-${var.environment}/postgresql/db_username"
  description = "PostgreSQL master user name"
  type        = "SecureString"
  value       = module.rds_cluster.master_username

  tags = {
    namespace   = var.namespace
    environment = var.environment
  }
}


resource "aws_ssm_parameter" "db_password" {
  name        = "/${var.namespace}-${var.environment}/postgresql/db_password"
  description = "PostgreSQL master password"
  type        = "SecureString"
  value       = random_string.random.result

  tags = {
    namespace   = var.namespace
    environment = var.environment
  }
}


resource "aws_ssm_parameter" "server_ecr_repository_url" {
  name        = "/${var.namespace}-${var.environment}/ecr/server_repository_url"
  description = "Server ECR repository URL"
  type        = "SecureString"
  value       = data.terraform_remote_state.base.outputs.nodejs_ecr_repository_url

  tags = {
    namespace   = var.namespace
    environment = var.environment
  }
}


