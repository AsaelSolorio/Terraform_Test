# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id  # Reference the output from the vpc module
}

# Output the NAT Gateway EIP
output "nat_gateway_eip" {
  description = "The Elastic IP of the NAT Gateway"
  value       = module.vpc.nat_gateway_eip  # Reference the output from the vpc module
}

# Output the EC2 instance public IP from the ec2 module
output "ec2_instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = module.ec2.instance_public_ip  # Reference the public IP output from the ec2 module
}

# Output the S3 bucket name from the s3 module
output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3.bucket_name  # Reference the bucket name output from the s3 module
}

# Output the private subnet IDs
output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids  # Reference the output from the vpc module
}

# Output the public subnet IDs
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids  # Reference the output from the vpc module
}
