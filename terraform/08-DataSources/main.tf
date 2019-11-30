provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_instance" "ansible" {
  filter {
    name   = "tag:Name"
    values = ["Ansible"]
  }
}

output "ami_id" {
  value = data.aws_instance.ansible.ami
}
