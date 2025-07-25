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
  value       = aws_instance.jenkins_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.private_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.public_dns
}
output "instance_private_dns" {
  description = "Private DNS name of the Jenkins EC2 instance"
  value       = aws_instance.jenkins_server.private_dns
}