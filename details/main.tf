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
#Details_servcie
########################################
resource "kubernetes_service" "details" {
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
#Details_ServiceAccount
########################################
resource "kubernetes_service_account" "details" {
  metadata {
    name = var.service_account_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      account = var.app_label
    }
  }
}

########################################
#Details_Deployment
########################################

resource "kubernetes_deployment" "details-v1" {
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
          
        }
      }
    }
  }
}