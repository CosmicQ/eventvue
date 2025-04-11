provider "aws" {
  region = var.aws_region
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
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

resource "aws_dynamodb_table" "config_table" {
  count        = var.cloud_provider == "aws" ? 1 : 0
  name         = "ConfigTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "accountid+alarm_name"

  attribute {
    name = "accountid+alarm_name"
    type = "S"
  }
}

resource "aws_dynamodb_table" "log_table" {
  count        = var.cloud_provider == "aws" ? 1 : 0
  name         = "LogTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "event_id"

  attribute {
    name = "event_id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "lock_table" {
  count        = var.cloud_provider == "aws" ? 1 : 0
  name         = "LockTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "event_id"

  attribute {
    name = "event_id"
    type = "S"
  }
}

resource "google_firestore_index" "config_index" {
  count        = var.cloud_provider == "gcp" ? 1 : 0
  project      = var.gcp_project_id
  collection   = "ConfigTable"
  fields {
    field_path = "accountid+alarm_name"
    order      = "ASCENDING"
  }
}

resource "google_firestore_index" "log_index" {
  count        = var.cloud_provider == "gcp" ? 1 : 0
  project      = var.gcp_project_id
  collection   = "LogTable"
  fields {
    field_path = "event_id"
    order      = "ASCENDING"
  }
}

resource "google_firestore_index" "lock_index" {
  count        = var.cloud_provider == "gcp" ? 1 : 0
  project      = var.gcp_project_id
  collection   = "LockTable"
  fields {
    field_path = "event_id"
    order
