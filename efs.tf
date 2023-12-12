module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "1.2.0"

  creation_token = "${local.project_name}_${local.environment}"
  name           = "${local.project_name}_${local.environment}"

  # Mount targets / security group
  mount_targets = {
    for k, v in zipmap(local.azs, local.private_subnets_id) : k => { subnet_id = v }
  }
  security_group_description = "${local.project_name}_${local.environment} EFS security group"
  security_group_vpc_id      = local.vpc_id
  security_group_rules = {
    vpc = {
      # relying on the defaults provdied for EFS/NFS (2049/TCP + ingress)
      description = "NFS ingress from VPC private subnets"
      cidr_blocks = local.private_subnets_cidr_blocks
    }
  }

  tags = local.tags
}

# resource "kubernetes_storage_class_v1" "efs" {
#   metadata {
#     name = "efs"
#   }

#   storage_provisioner = "efs.csi.aws.com"
#   parameters = {
#     provisioningMode = "efs-ap" # Dynamic provisioning
#     fileSystemId     = module.efs.id
#     directoryPerms   = "700"
#   }

#   mount_options = [
#     "iam"
#   ]

#   depends_on = [
#     module.eks_blueprints_addons
#   ]
# }