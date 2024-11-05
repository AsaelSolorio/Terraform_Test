# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

# Call the VPC module
module "vpc" { 
  source           = "./modules/vpc"
  region           = var.region
  access_key       = var.access_key
  secret_key       = var.secret_key
  vpc_cidr         = var.vpc_cidr  # Ensure you define this variable
  vpc_name         = var.vpc_name   # Ensure you define this variable
  private_subnets  = var.private_subnets  # Ensure you define this variable
  public_subnets   = var.public_subnets  # Ensure you define this variable
  environment      = var.environment
  availability_zones = var.availability_zones
}

# Call the EC2 module
module "ec2" {
  source        = "./modules/ec2_instance"
  ami           = var.ami
  instance_type = var.instance_type
  instance_name = var.instance_name
}

# Call the S3 module
module "s3" {
  source       = "./modules/s3_bucket"
  bucket_name  = var.bucket_name
  environment  = var.environment
}
