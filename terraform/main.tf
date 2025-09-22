provider "helm" {
  kubernetes = {
    config_path = "/home/tfc-agent/.kube/config"
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