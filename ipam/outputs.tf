
output "ipam_pool_region1_id" {
  description = "Infrastructure Environment"
  value       = awscc_ec2_ipam_pool.region1.id
}

output "ipam_pool_region2_id" {
  description = "Infrastructure Environment"
  value       = awscc_ec2_ipam_pool.region2.id
}
