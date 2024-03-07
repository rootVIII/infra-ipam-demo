
resource "awscc_ec2_ipam" "main" {
  operating_regions = var.operating_regions
  tags = [{
    key   = "Name"
    value = "global-ipam"
  }]
}

resource "awscc_ec2_ipam_pool" "root" {
  address_family = "ipv4"
  ipam_scope_id  = awscc_ec2_ipam.main.private_default_scope_id
  auto_import    = false

  provisioned_cidrs = var.root_provisioned_cidrs

  tags = [{
    key   = "Name"
    value = "top-level-pool"
  }]
}

resource "awscc_ec2_ipam_pool" "region1" {
  address_family      = "ipv4"
  auto_import         = false
  ipam_scope_id       = awscc_ec2_ipam.main.private_default_scope_id
  locale              = "us-east-1"
  source_ipam_pool_id = awscc_ec2_ipam_pool.root.ipam_pool_id

  provisioned_cidrs = var.provisioned_cidrs_region1

  tags = [{
    key   = "Name"
    value = "regional-pool-region1"
  }]
}

resource "awscc_ec2_ipam_pool" "region2" {
  address_family      = "ipv4"
  auto_import         = false
  ipam_scope_id       = awscc_ec2_ipam.main.private_default_scope_id
  locale              = "us-east-2"
  source_ipam_pool_id = awscc_ec2_ipam_pool.root.ipam_pool_id

  provisioned_cidrs = var.provisioned_cidrs_region2

  tags = [{
    key   = "Name"
    value = "regional-pool-region2"
  }]
}
