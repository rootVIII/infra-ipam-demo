
output "environment" {
  description = "Infrastructure Environment"
  value       = var.environment
}

output "region1" {
  description = "Region 1"
  value       = var.region1
}

output "region2" {
  description = "Region 2"
  value       = var.region2
}

output "vpc1_id" {
  description = "VPC ID 1"
  value       = module.network.vpc_id1
}

output "vpc2_id" {
  description = "VPC ID 2"
  value       = module.network.vpc_id2
}
