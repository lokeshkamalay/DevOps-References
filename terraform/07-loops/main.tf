variable "users" {
  description = "list of users"
  type        = "list"
  default     = ["king", "queen", "prince"]
}
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_iam_user" "type1" {
  count = 3
  name  = "test-${count.index}"
}

resource "aws_iam_user" "type2" {
  count = 3
  name  = "${var.users[count.index]}"
}

output "type1" {
  value = aws_iam_user.type1.*.name
}

output "type2" {
  value = aws_iam_user.type2.*.name
}
