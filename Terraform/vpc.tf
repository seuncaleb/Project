// SETTING UP THE VPC
resource "aws_vpc" "project-vpc" {
  cidr_block            = "10.0.0.0/16"
  instance_tenancy      = "default"
  enable_dns_support    = "true"
  enable_dns_hostnames  = "true"
  tags  = {
    Name = "project-vpc"
  }
}

// CREATING PUBLIC SUBNETS INSIDE VPC
resource "aws_subnet" "project-subnet-1" {
  vpc_id                  = aws_vpc.project-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       =  "us-east-1a"
  map_public_ip_on_launch = "true"
  tags                    = {
   Name                   = "Subnet A"
  }
}


// CREATING INTERNET GATEWAY FOR THE INSTANCES
resource "aws_internet_gateway" "project-ingw" {
 vpc_id = aws_vpc.project-vpc.id
 tags   = {
   Name = "project-ingw"
 }
}

// CREATING THE ROUTE TABLES FOR THE INTERNET GATEWAY
resource "aws_route_table" "project-ingw-rt-1" {
  vpc_id = aws_vpc.project-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-ingw.id
  }
  tags   = {
    Name = "project-ingw-rt-1"
  }
 }

// CREATING ROUTE TABLE ASSOCIATIONS FOR THE SUBNETS
resource "aws_route_table_association" "public-subnet-rta1" {
  subnet_id      = aws_subnet.project-subnet-1.id
  route_table_id = aws_route_table.project-ingw-rt-1.id
}


//CREATING THE SECURITY GROUP
resource "aws_security_group" "project-sg" {
  vpc_id = aws_vpc.project-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "aws_vpc.project-sg"
  }
}