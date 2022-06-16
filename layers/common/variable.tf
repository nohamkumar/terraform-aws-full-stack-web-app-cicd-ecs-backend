variable "main_region" {
  description = "AWS region"
  type        = string
}

variable "namespace" {
  description = "Project name"
  type        = string
}

variable "domain" {
  description = "Domain name for Route53 hosted zone configuration"
  type        = string
}
