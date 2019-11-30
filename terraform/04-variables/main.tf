#terraform apply -var=ami="ami-00dc79254d0461090" to overwrite the default var
#terraform apply -var-file="prod.tfvars"
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}
resource "aws_instance" "main" {
  ami               = "${var.ami}"
  availability_zone = "${var.availability_zone[0]}"
  instance_type     = "${var.instance_type}"
  key_name          = "${var.key_name["prod"]}"
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
