
resource "aws_vpc" "vpc_region1" {
  provider = aws.region1_alias

  ipv4_ipam_pool_id   = var.ipv4_ipam_pool_id_region1
  ipv4_netmask_length = 24

  tags = {
    Name = "Region 1 VPC"
  }
}

resource "aws_vpc" "vpc_region2" {
  provider = aws.region2_alias

  ipv4_ipam_pool_id   = var.ipv4_ipam_pool_id_region2
  ipv4_netmask_length = 24

  tags = {
    Name = "Region 2 VPC"
  }
}

locals {
  vpc1_az = "${var.region1}a"
  vpc2_az = "${var.region2}a"
}
