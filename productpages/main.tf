data "terraform_remote_state" "namespace" {
  backend = "remote"

  config = {
    organization = "hc-cnfp2"
    workspaces = {
      name = "namespace"
    }
  }
}

########################################
#Prodcutpage_servcie
########################################
resource "kubernetes_service" "productpage" {
  metadata {
    name = var.service_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
        app = var.app_label
        service = var.service_name
    }
  }
  spec {
    selector = {
      app = var.app_label
    }
    
    port {
      port = var.container_port
      name = "http"
    }

  }
}

########################################
#Prodcutpage_servcie_Account
########################################

resource "kubernetes_service_account" "example" {
  metadata {
    name = var.service_account_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      account = var.app_label
    }
  }
}


########################################
#Prodcutpage_Deployment
########################################

resource "kubernetes_deployment" "productpage" {
  metadata {
    name = var.deployment_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      app = var.app_label
      version = var.version_label

    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_label
        version = var.version_label
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_label
          version = var.version_label
        }
        annotations = {
          "prometheus.io/scrape" = "true"
          "prometheus.io/port"   = "9080"
          "prometheus.io/path"   = "/metrics"
        }
      }

      spec {
        service_account_name = var.service_account_name
        container {
          image = var.container_image
          name  = var.container_name
          image_pull_policy = var.image_pull_policy

          port {
            container_port = var.container_port
          }

          volume_mount {
            name       = "tmp"
            mount_path = "/tmp"
          }
          
        }
      volume {
        name = "tmp"
        empty_dir {}
      }
      }
    }
  }
}