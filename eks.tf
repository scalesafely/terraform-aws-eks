module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name                   = "${local.project_name}_${local.environment}"
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true

  vpc_id                         = local.vpc_id
  subnet_ids                     = local.private_subnets_id

  manage_aws_auth_configmap = true

  eks_managed_node_groups = {
    managed_ng = {
      instance_types  = [local.instance_types]

      subnet_ids   = local.private_subnets_id
      max_size     = local.node_size
      desired_size = local.node_size
      min_size     = local.node_size
    }
  }

  aws_auth_users = [
    for user_arn in local.user_arn : {
      userarn  = user_arn
      username = split("/", user_arn)[1]
      groups   = ["system:masters"]
    }
  ]

  aws_auth_roles = [
    for role_arn in local.role_arn : {
      rolearn  = role_arn
      username = split("/", role_arn)[1]
      groups   = ["system:masters"]
    }
  ]
  tags = local.tags
}
