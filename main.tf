terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }

    required_version =">= 0.14.9"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-03c983f9003cb9cd1"
  instance_type = "t2.micro"
  key_name = "seixas-oregon-ec2"
  # user_data = <<-EOF
  #                #! /bin/bash
  #                cd /home/ubuntu
  #                echo "<h1>Feito com Terraform</>" > index.html
  #                nohup busybox httpd -f -p 8080 &
  #                EOF 
  tags = {
    Name = "Teste AWS"
  }
}