variable "main_region" {
  description = "AWS main region"
  type        = string
}

variable "namespace" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}


#---
#CDN
#---

variable "aliases" {
  description = "Aliases of the website"
  type        = list(string)
}

#---
#CICD S3
#---

variable "cicd_s3_name_attributes" {
  description = "Name defining the application"
  type        = list(string)
}

variable "website_github_repository" {
  description = "GitHub Respository name"
  type        = string
}

variable "website_github_branch" {
  description = "GitHub branch name"
  type        = string
}

#---
#CICD ECS
#---

variable "cicd_ecs_name_attributes" {
  description = "Name defining the application"
  type        = list(string)
}

variable "nodejs_github_repository" {
  description = "GitHub Respository name"
  type        = string
}

variable "nodejs_github_branch" {
  description = "GitHub branch name"
  type        = string
}

#---
#ECS
#---

variable "container_port" {
  description = "Container port number for port mapping"
  type        = number
}

variable "task_cpu" {
  description = "Task CPU size"
  type        = number
}
variable "task_memory" {
  description = "Task memory size"
  type        = number
}

#--
#RDS
#--

variable "postgresql_admin_username" {
  description = "PostgreSQL Admin UserName"
  type        = string
}

variable "which_db" {
  description = "Which DB is used. Ex: postgresql. This is used only for DB naming"
  type        = string
}

variable "rds_engine" {
  description = "RDS engine. Ex: aurora-postgresql"
  type        = string
}

variable "rds_engine_version" {
  description = "RDS engine version. Ex: 13.6"
  type        = string
}

variable "rds_engine_mode" {
  description = "RDS engine mode. Ex: provisioned"
  type        = string
}

variable "rds_cluster_family" {
  description = "RDS cluster family. Ex: aurora-postgresql13"
  type        = string
}

variable "rds_cluster_size" {
  description = "RDS cluster size. Ex: 1"
  type        = number
}

variable "rds_instance_type" {
  description = "RDS instance type. Ex: db.t4g.medium"
  type        = string
}
