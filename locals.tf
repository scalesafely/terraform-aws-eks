locals {
  project_name                = var.project_name
  environment                 = var.environment
  node_size                   = var.cluster_node_size
  instance_types              = var.instance_types
  
  azs                         = slice(data.aws_availability_zones.available.names, 0, var.az_coverage)
  vpc_id                      = var.vpc_id
  private_subnets_id          = var.vpc_private_subnets_id
  private_subnets_cidr_blocks = var.vpc_private_subnets_cidr_blocks
  cluster_version             = var.cluster_version

  user_arn      = var.user_arn
  role_arn      = var.role_arn

  tags = {
    project     = local.project_name
    environment = local.environment
    iac         = "true"
  }
}

data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}