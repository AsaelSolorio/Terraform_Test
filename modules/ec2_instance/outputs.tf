# modules/ec2_instance/outputs.tf
output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.ec2.public_ip  # Change 'this' to 'ec2'
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2.id  # Change 'this' to 'ec2'
}
