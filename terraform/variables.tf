variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "username" {
  type        = string
  default     = "noname"
}

variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/24"
}

variable "public_subnets_cidr" {
  description = "AWS Region"
  type        = list(string)
  default     = ["192.168.0.0/26", "192.168.0.64/26"]
}
variable "volume_attachment" {
  description = "Should additional volume be created?"
  type = bool
  default = false
}