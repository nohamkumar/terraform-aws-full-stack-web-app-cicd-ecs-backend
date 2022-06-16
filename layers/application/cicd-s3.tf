module "cicd-frontend" {
  source      = "git@github.com:nohamkumar/aws-codepipeline-cicd.git"
  namespace   = var.namespace
  environment = var.environment
  attributes  = var.cicd_s3_name_attributes

  #---
  #CODEBUILD
  #---
  codebuild_cloudwatch_logs = true
  buildspec_path            = "./buildspec/${var.environment}/website/buildspec.yml"

  #---
  #CODEPIPELINE
  #---

  github_repository = var.website_github_repository
  github_branch     = var.website_github_branch
  deploy_provider   = "S3"

  deploy_config = {
    BucketName = module.cdn_cloudfront_s3.s3_bucket
    Extract    = "true"
  }

  depends_on = [
    module.cdn_cloudfront_s3
  ]
}
