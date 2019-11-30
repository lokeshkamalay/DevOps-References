provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "main" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name      = "MAC"

  tags = {
    Name = "MyEc2"
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
