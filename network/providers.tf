terraform {
  required_providers {

    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.0"
      configuration_aliases = [aws.region1_alias, aws.region2_alias]
    }
  }
  required_version = ">=1.6.0"
}
