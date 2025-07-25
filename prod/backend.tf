terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    key            = "prod/terraform.state"
    bucket         = "ec2-lambda-terraform-backend"
    region         = "us-east-2"
    dynamodb_table = "terra-ec2-lamda-state-locking"
  }
}
