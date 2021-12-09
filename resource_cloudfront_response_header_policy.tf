# module "cloudfront-sec-resp-header-policy" {
#   source = "./tf-modules/cloudfront-sec-resp-header-policy"
#   prefix = "${var.prefix}"
# }

resource "aws_cloudfront_response_headers_policy" "response_policy_sec" {
  name    = "${var.prefix}-security-headers"
  comment = "Policy defining the custom response headers updated for security reasons (ref. ADR-0002)"

  security_headers_config {

    strict_transport_security {
      access_control_max_age_sec = 63072000
      include_subdomains         = true
      override                   = true
      preload                    = true
    }

    content_security_policy {
        content_security_policy = "default-src * 'unsafe-inline' 'unsafe-eval' ; style-src * 'unsafe-inline'; script-src * 'unsafe-inline' 'unsafe-eval'; font-src 'self' data: ; img-src * data: 'unsafe-inline' blob: ; media-src * blob: data: ; connect-src * 'unsafe-inline';"
        override = true
    }

    content_type_options {
        #  This setting determines whether CloudFront adds the X-Content-Type-Options header to responses. When this setting is enabled, CloudFront adds the X-Content-Type-Options: nosniff header to responses. Otherwise CloudFront doesn’t add this header.
        override = true
    }

    frame_options {
      frame_option = "DENY"
      override     = true
    }

    xss_protection {
      mode_block = true
      override   = true
      protection = true
    }

    referrer_policy {
        referrer_policy = "no-referrer-when-downgrade"
        override   = true
    }

  }

}