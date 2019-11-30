variable "cidr_block" {
  type        = "string"
  description = "The Default CIDR Block"
  default     = "10.0.0.0/26"
}

variable "tags" {
  type        = "map"
  description = "Default Tags"
  default = {
    Name        = "TestApp"
    Environment = "Testing"
  }
}
