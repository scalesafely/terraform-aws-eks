<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.5.4 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.9 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.22.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_efs"></a> [efs](#module\_efs) | terraform-aws-modules/efs/aws | 1.2.0 |
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 19.15.3 |
| <a name="module_eks_blueprints_addons"></a> [eks\_blueprints\_addons](#module\_eks\_blueprints\_addons) | aws-ia/eks-blueprints-addons/aws | 1.12.0 |

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.clusterissuer](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubernetes_storage_class_v1.efs-csi-storage-class](https://registry.terraform.io/providers/hashicorp/kubernetes/2.22.0/docs/resources/storage_class_v1) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_coverage"></a> [az\_coverage](#input\_az\_coverage) | Number of availability zones coverage, indicates also how many subnets | `number` | `3` | no |
| <a name="input_cluster_node_size"></a> [cluster\_node\_size](#input\_cluster\_node\_size) | cluster node size | `number` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | the cluster version | `string` | `"1.27"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The type of environement to be deployed eg. production, stagging | `string` | `"prod"` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | The type of isntance | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name can be the site name or the client name | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | n/a | `list(string)` | `[]` | no |
| <a name="input_user_arn"></a> [user\_arn](#input\_user\_arn) | n/a | `list(string)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |
| <a name="input_vpc_private_subnets_cidr_blocks"></a> [vpc\_private\_subnets\_cidr\_blocks](#input\_vpc\_private\_subnets\_cidr\_blocks) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_private_subnets_id"></a> [vpc\_private\_subnets\_id](#input\_vpc\_private\_subnets\_id) | n/a | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->