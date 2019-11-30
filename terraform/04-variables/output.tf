output "instance_pvt_ip_addr" {
  value = aws_instance.main.private_ip
}

output "instance_pub_ip_addr" {
  value = aws_instance.main.public_ip
}

output "instance_id" {
  value = aws_instance.main.id
}
