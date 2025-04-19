resource "aws_instance" "name" {
  ami                    = "ami-09c813fb71547fc4f" # custom ami our devops-practice ami
  vpc_security_group_ids = [aws_security_group.allow_all_docker.id]
  instance_type          = "t3.micro"

  # 20gb is not enough for docker, so we need to increase the size
  # to 50gb
  root_block_device {
    volume_size = 50 #set root volume size to 50GB
    volume_type = "gp3" # use gp3 for better performance(optional)
    delete_on_termination = true
  }
  tags = {
    Name    = "docker"
  }

}

resource "aws_security_group" "allow_all_docker" {
  name        = "allow_all_docker"
  description = "Allow TLS inbound traffic and all outbound traffic"

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
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "allow_tls"
  }
}