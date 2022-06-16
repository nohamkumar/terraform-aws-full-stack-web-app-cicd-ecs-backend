resource "aws_ecr_repository" "application_repository" {
  name = "${var.namespace}-${var.environment}"

  image_scanning_configuration {
    scan_on_push = true
  }
}
