
resource "aws_cloudfront_distribution" "website" {
  
  origin {
    domain_name = aws_s3_bucket.website.bucket_regional_domain_name
    origin_id   = "${aws_s3_bucket.website.id}-origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.website.cloudfront_access_identity_path
    }
  }

  enabled         = true
  is_ipv6_enabled = true

  default_root_object = "index.html"

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/error.html"
  }

  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]


    cached_methods = [
      "GET",
      "HEAD",
    ]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    target_origin_id       = "${aws_s3_bucket.website.id}-origin"
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "blacklist"
      locations = ["CA"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    # acm_certificate_arn            = aws_acm_certificate.cert.arn
    ssl_support_method             = "sni-only"
    # tfsec:ignore:AWS021
    minimum_protocol_version = "TLSv1.2_2018"
  }
  retain_on_delete = false
  tags             = {
    Name = "My cloudfront test bucket"
  }
}

