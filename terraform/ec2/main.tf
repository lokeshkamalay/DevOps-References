resource "aws_vpc" "main" {
    cidr_block = var.cidr_block
    tags = {
        Name = "${var.prefix}-vpc"
    }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet

  tags = {
    Name = "${var.prefix}-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet

  tags = {
    Name = "${var.prefix}-private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.prefix}-public-rt"
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_network_interface" "main" {
  subnet_id   = aws_subnet.public.id

  tags = {
    Name = "${var.prefix}-public-nic"
  }
}

resource "aws_instance" "main" {
  ami                         = var.ami
  instance_type               = var.instance_type
#   subnet_id                   = aws_subnet.public.id
  key_name                    = var.key_name
#   associate_public_ip_address = true

  network_interface {
    network_interface_id = aws_network_interface.main.id
    device_index         = 0
  }
  
  tags = {
    Name = "${var.prefix}-public-vm"
  }
}