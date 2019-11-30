resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"
  tags = {
    Name = "${var.appname}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "${var.appname}-igw"
  }
}

resource "aws_subnet" "pubSubNet" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.pubsn_cidr_block}"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.appname}-public-1a-sn"
  }
}

resource "aws_subnet" "prvSubNet" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.prvsn_cidr_block}"
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.appname}-private-1b-sn"
  }
}

# resource "aws_route_table" "pubRT" {
#   vpc_id = "${aws_vpc.main.id}"

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = "${aws_internet_gateway.main.id}"
#   }
#   tags = {
#     Name = "${var.appname}-pubRT"
#   }
# }

resource "aws_default_route_table" "pubRT" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = {
    Name = "${var.appname}-pubRT"
  }
}

resource "aws_route_table" "prvRT" {
  vpc_id = "${aws_vpc.main.id}"
  tags = {
    Name = "${var.appname}-prvRT"
  }
}
resource "aws_route_table_association" "prvrtascn" {
  subnet_id      = "${aws_subnet.prvSubNet.id}"
  route_table_id = "${aws_route_table.prvRT.id}"
}

resource "aws_instance" "main" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"

  tags = {
    Name = "${var.appname}-ec2"
  }
}
