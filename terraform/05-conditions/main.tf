provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami               = "ami-04b9e92b5572fa0d1"
  instance_type     = "t2.micro"
  key_name          = "MAC"
  availability_zone = "${var.environment == "prod" ? var.availability_zone["private"] : var.availability_zone["public"]}"

  tags = {
    Name = "MyEc2"
  }
}
