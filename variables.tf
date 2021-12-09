variable "aws_region" {
  description = "The AWS region to deploy the resources into"
  type = string
  default = "us-east-1"
}

variable "aws_account_id" {
  description = "The AWS account identifier of the project"
  type = string
  default = "1234567891234"
}

variable "prefix" {
  description = "The resource prefix"
  type = string
  default = "alf-dev-cloudfront"
}

variable "bucket_name" {
  description = "The bucket name for cloudfront"
  type = string
  default = "alf-dev-cloudfront-testbucket2"
}

variable "bucket_versioning" {
  default = false
}
variable "force_destroy" {
  default = true
}
variable "cfpolicy_referrer_policy" {
  default = true
}
variable "cfpolicy_strict_transport_security" {
  default = true
}
variable "cfpolicy_content_security_policy" {
  default = true
}
variable "cfpolicy_" {
  default = true
}
variable "cfpolicy_" {
  default = true
}

variable "common_tags" {
  description = "The tags for the bucket"
  type = map
  default = {
  "purpose" : "experimentcfpolicy"
  }
}


locals {
  iot_policy = "${var.prefix}-thing2"
}



