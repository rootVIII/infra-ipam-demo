
output "vpc_id1" {
  description = "VPC ID"
  value       = aws_vpc.vpc_region1.id
}

output "vpc_id2" {
  description = "VPC ID"
  value       = aws_vpc.vpc_region2.id
}
