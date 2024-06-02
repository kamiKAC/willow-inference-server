output "server_public_ipv4" {
  value = module.ec2_instance.public_ip
  }

output "server_public_dns" {
  value = module.ec2_instance.public_dns
  }