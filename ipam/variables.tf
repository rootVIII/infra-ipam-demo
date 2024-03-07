
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
