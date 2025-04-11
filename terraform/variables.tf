variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "gcp_project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "gcp_region" {
  description = "The Google Cloud region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "cloud_provider" {
  description = "The cloud provider to deploy to (aws or gcp)"
  type        = string
  default     = "aws"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda functions"
  type        = string
  default     = "python3.8"
}

variable "lambda_handler" {
  description = "The handler for the Lambda functions"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_zip_files" {
  description = "The zip files for the Lambda functions"
  type        = map(string)
  default = {
    log_event_function = "log_event_function.zip"
    lock_event_function = "lock_event_function.zip"
    unlock_event_function = "unlock_event_function.zip"
    notify_function = "notify_function.zip"
  }
}
