resource "aws_dynamodb_table" "ec2_status" {
  name           = "${var.environment}-ec2-status"
  billing_mode   = var.environment == "prod" ? "PROVISIONED" : "PAY_PER_REQUEST"
  read_capacity  = var.environment == "prod" ? var.dynamodb_read_capacity : null
  write_capacity = var.environment == "prod" ? var.dynamodb_write_capacity : null
  hash_key       = "InstanceId"
  range_key      = "Timestamp"

  attribute {
    name = "InstanceId"
    type = "S"
  }

  attribute {
    name = "Timestamp"
    type = "S"
  }

  tags = {
    Name        = "${var.environment}-ec2-status"
    Environment = var.environment
  }
}