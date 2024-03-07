
resource "aws_vpc" "vpc_region1" {
  provider = aws.region1_alias

  ipv4_ipam_pool_id   = var.ipv4_ipam_pool_id_region1
  ipv4_netmask_length = 24

  tags = merge({
    Name = "us-east-1"
    },
    var.shared_tags
  )
}

resource "aws_vpc" "vpc_region2" {
  provider = aws.region2_alias

  ipv4_ipam_pool_id   = var.ipv4_ipam_pool_id_region2
  ipv4_netmask_length = 24

  tags = {
    Name = "Region 2 VPC"
  }
}
