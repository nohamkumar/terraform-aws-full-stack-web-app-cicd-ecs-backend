output "tf_sg_xyz_cdn_origin_bucket" {
  description = "S3 bucket name of CloudFront CDN origin"
  value       = module.cdn_cloudfront_s3.s3_bucket
}
