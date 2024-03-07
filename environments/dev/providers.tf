
terraform {
  required_providers {
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 0.71.0" // pessimistic constraint operator allows right most value to update
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">=1.6.0"
  backend "s3" {} // required backend arg to be provided with "terraform init" cmd
}

provider "awscc" {
  region = var.region1
}

provider "aws" {
  region = var.region1
  alias  = "region1_alias"
}

provider "aws" {
  region = var.region2
  alias  = "region2_alias"
}
