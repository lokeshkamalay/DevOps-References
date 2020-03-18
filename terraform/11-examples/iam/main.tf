provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

resource "aws_iam_group" "demo_dev" {
  name = "demo-developers"
}

resource "aws_iam_group" "demo_prod" {
  name = "prod-support"
}

resource "aws_iam_user" "demo" {
  name = "demo-user"
}

resource "aws_iam_group_membership" "demo-gm-dev" {
  name = "demo-gm-dev"
  users = ["${aws_iam_user.demo.name}"]
  group = "${aws_iam_group.demo_dev.name}"
}

resource "aws_iam_group_membership" "demo-gm-prod" {
    name = "demo-gm-prod"
    users = ["${aws_iam_user.demo.name}"]
    group = "${aws_iam_group.demo_prod.name}"
}

resource "aws_iam_group_policy_attachment" "demo-ec2-full" {
  group      = "${aws_iam_group.demo_prod.name}"
  policy_arn = "${var.ec2_full_policy}"
}
resource "aws_iam_group_policy_attachment" "demo-ec2-read" {
  group      = "${aws_iam_group.demo_dev.name}"
  policy_arn = "${var.ec2_read_policy}"
}
