#terraform apply -var=ami="ami-00dc79254d0461090" to overwrite the default var
#terraform apply -var-file="prod.tfvars"

variable "ami" {
  description = "Ami ID for ec2 machine"
  type        = "string"
  default     = "ami-04b9e92b5572fa0d1"
}

variable "instance_type" {
  description = "Instance Type"
  type        = "string"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key to be used for ssh"
  type        = "string"
  default     = "MAC"
}
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}
resource "aws_instance" "main" {
  ami               = "${var.ami}"
  availability_zone = "us-east-1a"
  instance_type     = "${var.instance_type}"
  key_name          = "${var.key_name}"
  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_type           = "gp2"
    volume_size           = "1"
    delete_on_termination = true
  }
  tags = {
    Name    = "Terraform"
    Project = "Demo"
  }
}

output "instance_pvt_ip_addr" {
  value = aws_instance.main.private_ip
}

output "instance_pub_ip_addr" {
  value = aws_instance.main.public_ip
}

output "instance_id" {
  value = aws_instance.main.id
}
