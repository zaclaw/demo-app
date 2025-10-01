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
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args = ["eks", "get-token", "--cluster-name", "education-eks-CBSoSr8o"]
      command = "aws"
    }
  }

  #registries = [
  #  {
  #    url      = var.registry_url
  #    username = var.registry_username
  #    password = var.registry_password
  #  }
  #]
}

resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
}