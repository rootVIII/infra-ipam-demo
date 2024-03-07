
variable "namespace" {
  description = "Set in tfvars"
  type        = string
}

variable "environment" {
  description = "Current infrastructure environment overwritten by tfvars"
  type        = string
}

variable "region1" {
  description = "AWS Region 1"
  default     = "us-east-1"
  type        = string
}

variable "region2" {
  description = "AWS Region 2"
  default     = "us-east-2"
  type        = string
}

variable "region1_alias" {
  description = "Alias for AWS Region 1"
  default     = "useast1"
  type        = string
}

variable "region2_alias" {
  description = "Alias for AWS Region 2"
  default     = "useast2"
  type        = string
}

locals {
  operating_regions = [
    {
      region_name = var.region1
    },
    {
      region_name = var.region2
    }
  ]
}

variable "root_provisioned_cidrs" {
  description = "Root CIDR Block"
  type        = list(map(string))
  default = [
    {
      cidr = "10.0.0.0/16"
    }
  ]
}

variable "provisioned_cidrs_region1" {
  description = "Provisioned us-east-1 CIDR Block"
  type        = list(map(string))
  default = [
    {
      cidr = "10.0.0.0/17"
    }
  ]
}

variable "provisioned_cidrs_region2" {
  description = "Provisioned us-east-2 CIDR Block"
  type        = list(map(string))
  default = [
    {
      cidr = "10.0.128.0/17"
    }
  ]
}
