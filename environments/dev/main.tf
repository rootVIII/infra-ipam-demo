// https://catalog.workshops.aws/manage-cloud-resources-with-terraform/en-US/shared-tags/shared-tags#define-tags-using-the-aws-label-module

// Each source could also be git, terraform, s3 buckets etc.
module "ipam" {
  source                    = "../../ipam"
  operating_regions         = local.operating_regions
  root_provisioned_cidrs    = var.root_provisioned_cidrs
  provisioned_cidrs_region1 = var.provisioned_cidrs_region1
  provisioned_cidrs_region2 = var.provisioned_cidrs_region2
}

module "network" {
  source = "../../network"
  providers = {
    aws.region1_alias = aws.region1_alias
    aws.region2_alias = aws.region2_alias
  }

  region1                   = var.region1
  region2                   = var.region2
  environment               = var.environment
  ipv4_ipam_pool_id_region1 = module.ipam.ipam_pool_region1_id
  ipv4_ipam_pool_id_region2 = module.ipam.ipam_pool_region2_id
}
