terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "s3-bucket-name"
    key    = "main-stack/terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "table_name"
  }
}

provider "aws" {
  region = var.authentication.region
  default_tags {
    tags = var.tags
  }
  assume_role {
    role_arn = var.authentication.assume_role_arn
  }
}