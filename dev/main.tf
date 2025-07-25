module "ec2" {
  source        = "../../modules/ec2"
  environment   = "dev"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

module "s3" {
  source      = "../../modules/s3"
  environment = "dev"
}

module "dynamodb" {
  source      = "../../modules/dynamodb"
  environment = "dev"
}

module "lambda" {
  source             = "../../modules/lambda"
  environment        = "dev"
  ec2_instance_id    = module.ec2.instance_id
  s3_bucket_name     = module.s3.bucket_name
  dynamodb_table_name = module.dynamodb.table_name
  lambda_timeout      = var.lambda_timeout
  lambda_memory_size  = var.lambda_memory_size
}

variable "aws_region" {
  default = "us-east-2"
}
