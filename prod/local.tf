locals {
  environment     = "prod"
  name_prefix     = "ec2-lamda-terraform-project-${local.environment}"

  tags = {
    Environment = local.environment
    Project     = "ec2-lambda-terraform-project"
    Owner       = "devops-team"
  }

  # Optional networking settings if used in your modules
  default_vpc_cidr = "10.0.0.0/16"
}
