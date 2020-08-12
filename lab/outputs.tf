output "bastion" {
  value = aws_instance.bastion.public_ip
}

output "api_server" {
  value = aws_instance.api.public_ip
}

