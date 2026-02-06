variable "aws_region" {
  type    = string
  default = "us-west-2"
}
variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "vockey"
}
