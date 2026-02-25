terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "server" {
  ami = "ami-019715e0d74f695be"
  instance_type = "t2.micro"
  key_name = "terraform"
  tags = {
    Name = "Sample-Server-with-OIDC" 
}
}

output "public_ip"{
 value = aws_instance.server.public_ip
}
