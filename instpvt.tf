# Create instance
resource "aws_instance" "web-app" {
  ami                    = "ami-0f5e8a042c8bfcd5e"
  instance_type          = "t2.micro"
  count                  =  1
  key_name               = "terraform"
  subnet_id              = aws_subnet.pvt-sub-1.id
  vpc_security_group_ids = ["${aws_security_group.demo.id}"]
  tags = {
    Name = "web-pvt"
  }
}

# Create Security-group
resource "aws_security_group" "demo" {
  vpc_id = aws_vpc.mvpc.id

  #Inbound Rules
  # HTTP acces from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # HTTPS access from any where
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSh access from any where
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #outbound Rules
  #internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-sg"
  }

}

