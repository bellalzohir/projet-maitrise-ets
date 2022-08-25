provider "helm" {
  kubernetes {
    config_path = "${path.module}/../kubeconfig"
  }
}

variable "use_new_scheduler" {
  description = "If set to true, deploys Openwhisk with new scheduler (The new scheduler feature is still in development)"
  type        = bool
  default     = false
}
#terraform apply -var="use_new_scheduler=true"

resource "helm_release" "owdev" {
  name       = "owdev"
  chart = var.use_new_scheduler ? "./openwhisk-chart-new-scheduler" : "./openwhisk-chart"
  namespace = kubernetes_namespace.openwhisk.id

  values = [
    var.use_new_scheduler ? file("${path.module}/OW-values-new-scheduler.yml") : file("${path.module}/OW-values.yml")
  ]
}