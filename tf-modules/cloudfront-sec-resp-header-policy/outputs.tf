output "policy_arn" {
  description = "The arn of the policy"
  value       = aws_cloudfront_response_headers_policy.response_policy_sec.arn
}
