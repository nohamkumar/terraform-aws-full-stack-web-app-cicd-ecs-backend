main_region = "us-east-1"

#---
#CDN
#---

aliases = [""]

#---
#CICD S3
#---

cicd_s3_name_attributes   = ["website"]
website_github_repository = ""
website_github_branch     = "main"

#---
#CICD ECS
#---

cicd_ecs_name_attributes = ["server"]
nodejs_github_repository = ""
nodejs_github_branch     = "main"

#---
#ECS
#---

container_port = 80
task_cpu       = 512
task_memory    = 1024

#--
#RDS
#--

postgresql_admin_username = "admin_user"
which_db                  = "postgresql"
rds_engine                = "aurora-postgresql"
rds_engine_version        = "13.6"
rds_engine_mode           = "provisioned"
rds_cluster_family        = "aurora-postgresql13"
rds_cluster_size          = 1
rds_instance_type         = "db.t4g.medium"

