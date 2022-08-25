provider "kubernetes" {
  config_path = "${path.module}/../kubeconfig"
}

resource "kubernetes_namespace" "jenkins" {
    metadata {
        name = "jenkins"
    }
}