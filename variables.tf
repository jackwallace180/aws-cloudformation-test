variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-3"
}

variable "instance_type" {
  description = "aws ec2 instance type"
  type        = string
  default     = "t3.micro"
}
