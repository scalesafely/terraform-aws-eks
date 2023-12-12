module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "1.12.0"

  depends_on = [ module.eks.eks_managed_node_groups ]

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  eks_addons = {
    aws-ebs-csi-driver = {
      most_recent = true
    }
    coredns = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
  }

  ## METRIC SERVER ##
  enable_metrics_server               = true
  metrics_server = {
    chart_version              = "3.8.1"
    namespace                  = "management-tools"
    create_namespace           = true
  }

  ## AWS EFS CSI DRIVER ##
  enable_aws_efs_csi_driver           = true
  aws_efs_csi_driver = {
    chart_version              = "2.4.7"
    namespace                  = "management-tools"
    create_namespace           = false
    values                     = [file("${path.module}/helm-config/efs-csi.yaml")]
  }

  ## AWS LOADBALANCER CONTROLLER ##
  enable_aws_load_balancer_controller = true
  aws_load_balancer_controller = {
    chart_version              = "1.5.4"
    namespace                  = "management-tools"
    create_namespace           = false
  }
  
  ## INGRESS NGINX CONTROLLER##
  enable_ingress_nginx                = true
  ingress_nginx = {
    chart_version             = "4.7.0"
    namespace                 = "management-tools"
    create_namespace          = false
    values                    = [file("${path.module}/helm-config/ingress-nginx.yaml")]
  }

  helm_releases = {
    cert_manager = {
      name             = "cert-manager"
      repository       = "https://charts.jetstack.io"
      chart            = "cert-manager"
      chart_version    = "v1.12.0"
      namespace        = "management-tools"
      create_namespace = false
      values           = [file("${path.module}/helm-config/cert-manager.yml")]
    }
  }

  tags = local.tags
}