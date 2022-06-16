output "tfstate_bucket_name" {
  description = "Name of the bucket to store .tfstate"
  value       = module.tfstate_bucket.tfstate_bucket_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table created for .tfstate file lock"
  value       = module.tfstate_bucket.dynamodb_table_name
}
