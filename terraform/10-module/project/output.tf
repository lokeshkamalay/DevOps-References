output "vpc_id" {
  value = "aws_vpc.main.id"
}

output "ec2_private_ip" {
  value = "aws_instance.main.public_ip"
}
