resource "aws_instance" "go_web_app" {
  ami             = "ami-09e67e426f25ce0d7"
  key_name        = "my-server"
  instance_type   = "t2.micro"
  security_groups = ["go_web_app_sg"]
  tags = {
    Name = "go_web_app"
  }
}
#Create security group with firewall rules
resource "aws_security_group" "go_web_app_sg" {
  name        = "go_web_app_sg"
  description = "SG for go web app"

  ingress {
    from_port   = 9009
    to_port     = 9009
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound ports
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "go_web_app_sg"
  }
}

# Create Elastic IP address
resource "aws_eip" "go_web_app" {
  vpc      = true
  instance = aws_instance.go_web_app.id
  tags = {
    Name = "go_web_app_eip"
  }
}