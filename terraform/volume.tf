resource "aws_volume_attachment" "ebs_volume" {
  count = var.volume_attachment ? 1 : 0
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.willow_ebs[0]
  instance_id = module.ec2_instance.id
}

resource "aws_ebs_volume" "willow_ebs" {
  count = var.volume_attachment ? 1 : 0
  availability_zone = module.vpc.azs[0]
  size              = 180
}