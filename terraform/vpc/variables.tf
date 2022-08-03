variable "vpc_cidr_block" {
    description = "This is a vpc cidr bloc"
    default = "10.0.0.0/26"
}

variable "public_subnet" {
    default = "10.0.0.0/28"
}

variable "private_subnet" {
    default = "10.0.0.16/28"
}

