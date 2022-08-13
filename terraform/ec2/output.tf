output "public_vm_ip" {
  value = aws_instance.main.private_ip
}
