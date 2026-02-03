output "instance_id" {
  value = aws_instance.main.id
}

output "public_ip" {
  value = aws_instance.main.public_ip
}

output "public_dns" {
  value = aws_instance.main.public_dns
}

output "ssh_command" {
  value = "ssh -i /path/to/key.pem ec2-user@${aws_instance.main.public_dns}"
}