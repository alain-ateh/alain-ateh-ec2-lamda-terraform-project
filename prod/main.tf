module "ec2" {
  source          = "../../modules/ec2"
  environment     = "prod"
  ami_id          = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  prod_cidr_block = var.prod_cidr_block
}

module "s3" {
  source      = "../../modules/s3"
  environment = "prod"
}

module "dynamodb" {
  source                  = "../../modules/dynamodb"
  environment             = "prod"
  dynamodb_read_capacity  = var.dynamodb_read_capacity
  dynamodb_write_capacity = var.dynamodb_write_capacity
}

module "lambda" {
  source              = "../../modules/lambda"  # Note: lamda instead of lambda
  environment         = "prod"
  ec2_instance_id     = module.ec2.instance_id
  s3_bucket_name      = module.s3.bucket_name
  dynamodb_table_name = module.dynamodb.table_name
  lambda_timeout      = var.lambda_timeout
  lambda_memory_size  = var.lambda_memory_size
}
