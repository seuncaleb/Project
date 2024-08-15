resource "aws_instance" "project-server" {
  ami               = "ami-007855ac798b5175e"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  security_groups   = [aws_security_group.project-sg.id]
  associate_public_ip_address   = true
  key_name          = "${var.key_pair_name}"
  subnet_id         = aws_subnet.project-subnet-1.id
  user_data = "${file("install.sh")}"

  tags = {
    Name = "project-server"
  }
}