
variable "access_key" {
  description = "access_key"
  type        = string
  sensitive   = true

}

variable "secret_key" {
  description = "secret_key"
  type        = string
  sensitive   = true

}

variable "region" {
  description = "region"
  type        = string
  sensitive   = true

}

variable "vpc_name" {
  type    = string
  default = "demo_vpc_terraform"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
    "private_subnet_3" = 3
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }
}

variable "ami" {
  description = "AMI for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment for the S3 bucket (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "availability_zones" {
  description = "List of Availability Zones to use"
  type        = list(string)
}
