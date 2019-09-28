provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_s3_bucket" "hello-terraform-s3" {
  bucket        = "hello-terraform-s3"
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}
