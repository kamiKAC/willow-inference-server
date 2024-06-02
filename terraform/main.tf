locals {
  userdata = <<-USERDATA
    #!/bin/bash
    apt-get update -y 
    apt-get install nginx -y
    apt-get dasda
  USERDATA
}

data "aws_availability_zones" "all" {}

data "aws_ami" "ubuntu" {
  owners        = ["099720109477"] # Canonical

  most_recent   = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
