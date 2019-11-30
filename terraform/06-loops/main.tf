provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "ec2" {
  count         = 2
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name      = "MAC"

  tags = {
    Name = "MyEc2"
  }
}

output "public_ip" {
  value = aws_instance.ec2.*.public_ip
}
