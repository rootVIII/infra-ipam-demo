
variable "operating_regions" {
  description = "Set in root Module"
  type        = list(map(string))
}

variable "root_provisioned_cidrs" {
  description = "Root CIDR Block"
  type        = list(map(string))
}

variable "provisioned_cidrs_region1" {
  description = "region1 CIDR Block"
  type        = list(map(string))
}

variable "provisioned_cidrs_region2" {
  description = "region2 CIDR Block"
  type        = list(map(string))
}

variable "shared_tags" {
  description = "Shared tags from root module"
  type        = list(map(string))
}

variable "region1" {
  description = "AWS region1 set in root module"
  type        = string
}

variable "region2" {
  description = "AWS region2 set in root module"
  type        = string
}

locals {
  cidr_blocks = [
    {
      "cidrs" : var.provisioned_cidrs_region1,
      "region" : var.region1,
    },
    {
      "cidrs" : var.provisioned_cidrs_region2,
      "region" : var.region2,
    }
  ]
}
