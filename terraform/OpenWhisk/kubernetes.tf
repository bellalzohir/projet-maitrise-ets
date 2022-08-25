provider "kubernetes" {
  config_path = "${path.module}/../kubeconfig"
}

resource "kubernetes_namespace" "openwhisk" {
  metadata {
    name = "openwhisk"
  }
}
