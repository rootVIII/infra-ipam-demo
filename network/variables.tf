
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "Set in root module"
  type        = string
}

variable "ipv4_ipam_pool_id_region1" {
  description = "Set in ipam module output"
  type        = string
}

variable "ipv4_ipam_pool_id_region2" {
  description = "Set in ipam module output"
  type        = string
}
