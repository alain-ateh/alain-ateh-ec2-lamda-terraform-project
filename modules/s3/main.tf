resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.environment}-ec2-logs-${random_string.bucket_suffix.result}"
  tags = {
    Name        = "${var.environment}-ec2-logs"
    Environment = var.environment
  }
}

# Random suffix to ensure bucket name uniqueness
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.log_bucket.id
  versioning_configuration {
    status = var.environment == "prod" ? "Enabled" : "Suspended"
  }
}

# Block public access
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket                  = aws_s3_bucket.log_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
