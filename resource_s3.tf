
resource "aws_s3_bucket" "website" {
  # checkov:skip=CKV2_AWS_6: ADD REASON
  # checkov:skip=CKV_AWS_144: Its a website
  # checkov:skip=CKV_AWS_145: Its a website
  # checkov:skip=CKV_AWS_19: "Ensure all data stored in the S3 bucket is securely encrypted at rest"
  # checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  # checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  bucket        = var.bucket_name
  acl           = "private"
  force_destroy = var.force_destroy

  versioning {
    enabled = var.bucket_versioning
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  cors_rule {
    allowed_headers = [
      "Authorization",
    ]
    allowed_methods = [
      "GET",
    ]
    allowed_origins = [
      "*",
    ]
    expose_headers  = []
    max_age_seconds = 3000
  }

  tags = var.common_tags
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.website.id
  key          = "index.html"
  source       = "${path.module}/files/index.html"
  content_type = "text/html"
  lifecycle {
    ignore_changes = all
  }
}

resource "aws_s3_bucket_object" "error" {
  bucket       = aws_s3_bucket.website.id
  key          = "error.html"
  source       = "${path.module}/files/error.html"
  content_type = "text/html"
  lifecycle {
    ignore_changes = all
  }
}

