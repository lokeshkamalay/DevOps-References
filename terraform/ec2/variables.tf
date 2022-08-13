variable "cidr_block" {
    description = "Cidr Block Details"
}

variable "prefix" {}
variable "public_subnet" {}
variable "private_subnet" {}
variable "ami" {}
variable "instance_type" {}
variable "key_name" {
    default = "mylaptop"
}