data "tfe_outputs" "cluster_ca_certificate" {
  organization = "zac-port-demo"
  workspace    = "aws-eks"
}

data "tfe_outputs" "cluster_endpoint" {
  organization = "zac-port-demo"
  workspace    = "aws-eks"
}

provider "helm" {
  kubernetes = {
    host = data.tfe_outputs.cluster_endpoint.values.cluster_endpoint
    cluster_ca_certificate = base64decode(data.tfe_outputs.cluster_ca_certificate.values.cluster_ca_certificate)
  }

  registries = [
    {
      url      = var.registry_url
      username = var.registry_username
      password = var.registry_password
    }
  ]
}

resource "helm_release" "demo_app" {
  name       = "demo-app"
  repository = "oci://registry-1.docker.io/zac88/"
  chart      = "demo-app"
  version    = "0.1.0"
}