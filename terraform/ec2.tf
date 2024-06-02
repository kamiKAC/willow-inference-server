module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "willow-ec2"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "g4dn.xlarge"
  key_name               = "willow_key"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.instance.id]
  subnet_id              = element(module.vpc.public_subnets, 0)
  user_data              = data.template_file.user_data.rendered

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

data "template_file" "user_data" {
  template = file("./provision.yaml")
}
