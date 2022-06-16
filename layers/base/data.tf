data "terraform_remote_state" "common" {
  backend = "s3"
  config = {
    bucket = "${var.namespace}-tfstate"
    key    = "common.tfstate"
    region = var.main_region
  }
}

