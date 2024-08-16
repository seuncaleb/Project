output "ec2_public_ip" {
  value = aws_instance.project-server.public_ip
}

