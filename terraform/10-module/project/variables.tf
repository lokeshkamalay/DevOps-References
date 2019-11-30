variable "vpc_cidr_block" {
  type        = "string"
  description = "VPC CIDR Block"
  default     = "10.0.0.0/26"
}

variable "appname" {
  type        = "string"
  description = "Application Name"
  default     = "Demo"
}

variable "pubsn_cidr_block" {
  type        = "string"
  description = "Public Subnet CIDR Block"
  default     = "10.0.0.0/28"
}

variable "prvsn_cidr_block" {
  type        = "string"
  description = "Private Subnet CIDR Block"
  default     = "10.0.0.16/28"
}

variable "ami" {
  default = "ami-00068cd7555f543d5"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "MAC"
}
