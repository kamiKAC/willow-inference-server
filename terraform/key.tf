#Resource to Create Key Pair
resource "aws_key_pair" "willow_key_pair" {
  key_name   = "willow_key"
  public_key = file("willow_rsa.pub")
}