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

resource "aws_instance" "terraform-test-1" {
 ami           = "ami-083d8a6500c1d55d6"
 instance_type = var.instance_type
 tags = {"Name" = "terraform-test-1"}
 tags_all = {"Name" = "terraform-test-1"}
}

resource "aws_ec2_instance_state" "stopping-tf-test" {
instance_id = aws_instance.terraform-test-1.id
state = "stopped"
}
