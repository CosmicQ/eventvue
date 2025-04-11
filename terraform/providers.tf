provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"  # Change to your desired region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
