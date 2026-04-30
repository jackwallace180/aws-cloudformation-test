terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 6.0"
   }
 }
}
 
provider "aws" {
 region = var.region
}

resource "aws_instance" "cloudformation-test-3" {
 ami           = "ami-083d8a6500c1d55d6"
 instance_type = var.instance_type
 tags = {"Name" = "cloudformation-test-3"}
 tags_all = {"Name" = "cloudformation-test-3"}
}

resource "aws_instance" "terraform-test" {
  count = 2
  ami = "ami-083d8a6500c1d55d6"
  instance_type = var.instance_type
  tags = {Name = "terraform-test-${count.index + 1}"}
}

action "aws_ec2_stop_instance" "stopping-tf-test" {
count = 2
config {
instance_id = aws_instance.terraform-test[count.index].id
}
}
