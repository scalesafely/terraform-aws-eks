resource "kubectl_manifest" "clusterissuer" {
  depends_on = [module.eks_blueprints_addons.helm_releases]

    yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    email: devops@scafe.io
    privateKeySecretRef:
      name: letsencrypt-prod
    server: https://acme-v02.api.letsencrypt.org/directory
    solvers:
      - http01:
          ingress:
            class: nginx
YAML
}

resource "kubernetes_storage_class_v1" "efs-csi-storage-class" {
  depends_on = [module.eks_blueprints_addons.enable_aws_efs_csi_driver]
  metadata {
    name = "efs-csi-sc"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
  storage_provisioner    = "efs.csi.aws.com"
  reclaim_policy         = "Delete"
  volume_binding_mode    = "WaitForFirstConsumer"
  allow_volume_expansion = "true"
  parameters = {
    provisioningMode = "efs-ap"
    fileSystemId     = module.efs.id
    directoryPerms   = "775"
    # uid              = "1000"
    # gid              = "33"
    # basePath = "/eks"
  }
}