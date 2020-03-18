variable "ec2_full_policy" {
  default = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

variable "ec2_read_policy" {
  default = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}
