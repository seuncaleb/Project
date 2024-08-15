output "ec2_public_ip" {
  value = aws_instance.project-server.public_ip
}
output "host_ips" {
  value = "${join("\n", [
    aws_instance.project-server.public_ip,
  ])}"
}