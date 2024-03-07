
resource "awscc_ec2_ipam" "main" {
  operating_regions = var.operating_regions
  tags = concat([{
    key   = "Name"
    value = "global-ipam"
    }],
    var.shared_tags
  )
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

resource "awscc_ec2_ipam_pool" "ipam_pools" {
  count               = 2
  address_family      = "ipv4"
  auto_import         = false
  ipam_scope_id       = awscc_ec2_ipam.main.private_default_scope_id
  locale              = local.cidr_blocks[count.index].region
  source_ipam_pool_id = awscc_ec2_ipam_pool.root.ipam_pool_id

  provisioned_cidrs = local.cidr_blocks[count.index].cidrs

  tags = [{
    key   = "Name"
    value = "regional-pool-region2"
  }]
}
