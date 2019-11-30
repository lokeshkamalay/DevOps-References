variable "availability_zone" {
  description = "Availability Zone for Public or Private"
  type        = "map"
  default = {
    public  = "us-east-1a"
    private = "us-east-1b"
  }
}

variable "environment" {
  description = "Environment of the resource"
  type        = "string"
  default     = "nonprod"
}
