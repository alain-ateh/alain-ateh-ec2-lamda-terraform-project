output "security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.ec2_sg.id
}

output "security_group_name" {
  description = "Name of the EC2 security group"
  value       = aws_security_group.ec2_sg.name
}

output "security_group_arn" {
  description = "ARN of the EC2 security group"
  value       = aws_security_group.ec2_sg.arn
}

output "instance_id" {
  description = "ID of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.id  # ← Fixed: jenkins_server instead of ec2_instance
}

output "instance_public_ip" {
  description = "Public IP address of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.public_ip  # ← Fixed
}

output "instance_private_ip" {
  description = "Private IP address of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.private_ip  # ← Fixed
}

output "instance_public_dns" {
  description = "Public DNS name of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.public_dns  # ← Fixed
}

output "instance_private_dns" {
  description = "Private DNS name of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.private_dns  # ← Fixed
}
output "instance_tags" {
  description = "Tags associated with the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.tags
}

output "instance_name" {
  description = "Name tag of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.tags["Name"]  # ← Fixed
}
output "instance_environment" {
  description = "Environment tag of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.tags["Environment"]  # ← Fixed
}
output "instance_type" {
  description = "Type of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.instance_type  # ← Fixed
}
output "instance_ami" {
  description = "AMI ID of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.ami  # ← Fixed
}
