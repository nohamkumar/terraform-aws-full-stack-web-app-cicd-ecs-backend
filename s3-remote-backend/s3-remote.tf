provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {}
}



module "tfstate_bucket" {
  source    = "git@github.com:nohamkumar/tfstate-s3-backend.git"
  namespace = "studiog"
}
