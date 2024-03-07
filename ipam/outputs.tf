
output "ipam_pool_ids" {
  description = "IPAM pool IDs for VPCs"
  value       = awscc_ec2_ipam_pool.ipam_pools[*].id
}
