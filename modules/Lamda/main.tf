resource "aws_iam_role" "lambda_role" {
  name = "${var.environment}-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "${var.environment}-lambda-policy"
  role = aws_iam_role.lambda_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:DescribeInstances",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "s3:PutObject",
          "dynamodb:PutItem"
        ]
        Resource = [
          "*",
          "arn:aws:s3:::${var.s3_bucket_name}/*",
          "arn:aws:dynamodb:::table/${var.dynamodb_table_name}"
        ]
      }
    ]
  })
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_function/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "monitor_ec2" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "${var.environment}-monitor-ec2"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.12"
  timeout          = var.lambda_timeout
  memory_size      = var.lambda_memory_size
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      INSTANCE_ID      = var.ec2_instance_id
      S3_BUCKET        = var.s3_bucket_name
      DYNAMODB_TABLE   = var.dynamodb_table_name
    }
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_cloudwatch_event_rule" "lambda_trigger" {
  name                = "${var.environment}-lambda-trigger"
  description         = "Triggers Lambda to monitor EC2 status every 5 minutes"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.lambda_trigger.name
  target_id = "${var.environment}-lambda-target"
  arn       = aws_lambda_function.monitor_ec2.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.monitor_ec2.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_trigger.arn
}
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "${var.environment}-lambda-bucket"
  acl    = "private"

  tags = {
    Environment = var.environment
  }
}