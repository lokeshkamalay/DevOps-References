provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

# Storing the state file safely in a remote location that is accessible to everyone
terraform {
  backend "s3" {
    bucket = "lokeshkamalay"
    key    = "terraform/hr.tfstate"
    region = "us-east-1"
  }
}

module "project" {
  source  = "../../10-module/project"
  appname = "TerrafromDemo"
}
