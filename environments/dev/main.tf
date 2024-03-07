// https://catalog.workshops.aws/manage-cloud-resources-with-terraform/en-US/shared-tags/shared-tags#define-tags-using-the-aws-label-module

// Each source could also be git, terraform, s3 buckets etc.
module "ipam" {
  source                    = "../../ipam"
  region1                   = var.region1
  region2                   = var.region2
  operating_regions         = local.operating_regions
  root_provisioned_cidrs    = var.root_provisioned_cidrs
  provisioned_cidrs_region1 = var.provisioned_cidrs_region1
  provisioned_cidrs_region2 = var.provisioned_cidrs_region2
  shared_tags               = module.tags_shared.tags
}

module "network" {
  source = "../../network"

  providers = {
    aws.region1_alias = aws.region1_alias
    aws.region2_alias = aws.region2_alias
  }

  environment               = var.environment
  ipv4_ipam_pool_id_region1 = module.ipam.ipam_pool_ids[0]
  ipv4_ipam_pool_id_region2 = module.ipam.ipam_pool_ids[1]
  shared_tags               = module.tags_shared.tags_aws
}

module "tags_shared" {
  source = "aws-ia/label/aws"
  tags = {
    terraform  = true
    CostCenter = "123456"
  }
}
