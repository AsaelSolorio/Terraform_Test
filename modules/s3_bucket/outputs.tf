# In s3_bucket/outputs.tf
output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket  # Comes from the aws_s3_bucket resource
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn  # Comes from the aws_s3_bucket resource
}