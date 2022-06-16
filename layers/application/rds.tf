
#---
#RDS security group
#---

resource "aws_security_group" "postgresql" {
  name        = "${var.namespace}-${var.environment}-postgresql"
  description = "Allow traffic from Task Definition"
  vpc_id      = data.terraform_remote_state.base.outputs.vpc_id

  tags = {
    Name = "${var.namespace}-${var.environment}-postgresql"
  }
}

resource "aws_security_group_rule" "ingress" {

  security_group_id        = aws_security_group.postgresql.id
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = module.ecs-td-service.task_security_group_id
}

resource "aws_security_group_rule" "egress" {

  security_group_id = aws_security_group.postgresql.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
#---

module "rds_cluster" {
  source = "git@github.com:nohamkumar/terraform-aws-rds-cluster.git"

  namespace   = var.namespace
  environment = var.environment

  db_name        = "${var.namespace}${var.which_db}"
  engine         = var.rds_engine
  engine_version = var.rds_engine_version
  engine_mode    = var.rds_engine_mode
  cluster_family = var.rds_cluster_family
  cluster_size   = var.rds_cluster_size
  instance_type  = var.rds_instance_type
  admin_user     = var.postgresql_admin_username
  admin_password = aws_ssm_parameter.db_password.value

  db_port             = 5432
  deletion_protection = true
  vpc_id              = data.terraform_remote_state.base.outputs.vpc_id
  subnets             = data.terraform_remote_state.base.outputs.public_subnet_ids
  security_groups     = ["${aws_security_group.postgresql.id}"]
}
