/*
 Input variables used to configure the 'Cloudfront-policy' module
*/

variable "aws_region" {
  description = "The AWS region to deploy the resources into"
  type = string
  default = "us-east-1"
}

variable "aws_cred_profile" {
  description = "The AWS profile from the configurations"
  type = string
  default = "default"
}

variable "prefix" {
  description = "The resource prefix"
  type = string
  default = "alf-dev-cloudfront"
}
