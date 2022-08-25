provider "helm" {
  kubernetes {
    config_path = "${path.module}/../kubeconfig"
  }
}

resource "kubernetes_namespace" "monitoring" { 
    metadata { 
        name = "monitoring" 
    } 
}

resource "kubernetes_config_map" "custom-dashboards" { 
  metadata { 
    name = "custom-dashboards" 
    namespace = kubernetes_namespace.monitoring.id
    labels = {
      grafana_dashboard="1"
    }
  } 
    data = { 
      "gafana_dashboard_actions_resources.json" = file("${path.module}/gafana_dashboard_actions_resources.json")
    }
}
resource "helm_release" "monitoring" {
  name       = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace = kubernetes_namespace.monitoring.id

  values = [
    file("${path.module}/monitoring-values.yaml")
  ]
}

variable "enable_telegraf" {
  description = "If set to true, deploys telegraf"
  type        = bool
  default     = false
}

resource "helm_release" "telegraf" {
  count = var.enable_telegraf ? 1 : 0
  name       = "telegraf"
  repository = "https://helm.influxdata.com/"
  chart      = "telegraf"
  namespace = kubernetes_namespace.monitoring.id

  values = [
    file("${path.module}/telegraf-values.yaml")
  ]
}
