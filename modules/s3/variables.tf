variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "The environment must be either 'dev' or 'prod'."
  }
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}