provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

module "vpc" {
  source     = "./10-module/vpc"
  cidr_block = "10.10.0.0/26"
  tags = {
    Name        = "myApplication"
    Environment = "Production"
  }
}

