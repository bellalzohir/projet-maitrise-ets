resource "kubernetes_persistent_volume_claim" "jenkins_pv_claim" {
    metadata {
        name = "jenkins-pv-claim"
        namespace = "jenkins"
    }
    spec {
        access_modes = ["ReadWriteOnce"]
        resources {
            requests = {
                storage = "3Gi"
            }
        }
        storage_class_name = "openebs-hostpath"
    }
}

resource "kubernetes_deployment" "jenkins" {
    metadata {
        name= "jenkins"
        namespace = "jenkins"
    }
    spec {
        replicas = 1
        selector {
            match_labels = {
                app = "jenkins"
            }
        }
        template {
            metadata {
                labels = {
                    app = "jenkins"
                }
            }
            spec {
                volume {
                    name = "jenkins-home"
                    persistent_volume_claim {
                        claim_name = "jenkins-pv-claim"
                    }
                }
                container {
                    name  = "jenkins"
                    image = "jenkins/jenkins:lts-jdk11"
                    port {
                        container_port = 8080
                    }
                    volume_mount {
                        name= "jenkins-home"
                        mount_path = "/var/jenkins_home"
                    }
                }
            }
        }
    }
}

resource "kubernetes_service" "jenkins" {
    metadata {
        name= "jenkins"
        namespace = "jenkins"
    }
    spec {
        port {
            port= 8080
            target_port = 8080
            node_port = 31002
        }
        selector = {
            app = "jenkins"
        }
        type = "NodePort"
    }
}