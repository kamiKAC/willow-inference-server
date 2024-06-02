resource "random_id" "id" {
  byte_length = 6
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name           = "willow-${random_id.id.hex}"
  cidr           = var.vpc_cidr
  azs            = formatlist(format("%s%%s", var.region), ["a", "b"])
  public_subnets = var.public_subnets_cidr

  enable_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_dhcp_options  = false
}
