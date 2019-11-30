variable "ami" {
  description = "Ami ID for ec2 machine"
  type        = "string"
  default     = "ami-04b9e92b5572fa0d1"
}

variable "instance_type" {
  description = "Instance Type"
  type        = "string"
  default     = "t2.micro"
}

#Map Variable
variable "key_name" {
  description = "Key to be used for ssh"
  type        = "map"
  default = {
    prod    = "MAC"
    nonprod = "aws"
  }
}

#List Variable
variable "availability_zone" {
  description = "Availalbe Zone"
  type        = "list"
  default     = ["us-east-1a", "us-east-1b"]
}
