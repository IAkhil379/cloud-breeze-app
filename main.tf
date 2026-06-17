# 1. Specify the cloud provider target
provider "aws" {
  region = "ap-south-1" # Hyderabad/Mumbai Region
}

# 2. Define the security group firewall rules
resource "aws_security_group" "breeze_sg" {
  name        = "cloud-breeze-sg"
  description = "Allow web traffic to app"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 3. Define the compute resource specification
resource "aws_instance" "breeze_server" {
  ami           = "ami-03f4fa076d2981b45" # Ubuntu 22.04 LTS Base Image
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.breeze_sg.id]

  tags = {
    Name = "Cloud-Breeze-Engine"
  }
}
