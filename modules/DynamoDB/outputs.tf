output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.ec2_status.name
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = aws_dynamodb_table.ec2_status.arn
}

output "dynamodb_table_id" {
  description = "The ID of the DynamoDB table"
  value       = aws_dynamodb_table.ec2_status.id
}

output "dynamodb_table_stream_arn" {
  description = "The stream ARN of the DynamoDB table (if enabled)"
  value       = aws_dynamodb_table.ec2_status.stream_arn
  # Note: will be empty if streams not enabled
  # You can add a condition if you use streams
}
