variable "region" {}
variable "vpc_cidr" {}
variable "subnet_cidr" {}
variable "availability_zone" {}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "default" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_security_group" "default" {
  name        = "test-security-group"
  description = "Allow TCP/ICMP"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1000
    to_port     = 2000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx_instance" {
  ami           = "ami-id" # Rajoute ton ID Ami pour BéBé malade
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "nginx-proxy"
  }
}

resource "aws_instance" "VM1" {
  ami           = "ami-id" # Rajoute ton ID Ami et prend un curly
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "VM1"
  }
}

resource "aws_instance" "VM2" {
  ami           = "ami-id" # Rajoute ton ID Ami bonney dans one piece est mort
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "VM2"
  }
}

resource "aws_instance" "VM3" {
  ami           = "ami-id" # Rajoute ton ID Ami bg
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "VM3"
  }
}

resource "aws_instance" "mysqldb" {
  ami           = "ami-id" # Rajoute ton ID Ami bg
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet-1.id
  vpc_security_group_ids = [aws_security_group.default.id]
  tags = {
    Name = "mysqldb"
  }
}
