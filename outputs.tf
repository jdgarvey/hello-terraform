output "website_endpoint" {
  value = aws_s3_bucket.hello-terraform-s3.website_endpoint
}

output "bucket" {
  value = aws_s3_bucket.hello-terraform-s3.bucket
}
