terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

// CONFIGURATION SETTINGS
provider "aws" {
  region = "us-east-1"
}