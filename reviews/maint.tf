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
#reviews_servcie
########################################

resource "kubernetes_service" "reviews" {
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
      port        = var.container_port
      name = "http"
    }

  }
}


########################################
#reviews_servcie_account
########################################

resource "kubernetes_service_account" "reviews" {
  metadata {
    name = var.service_account_name
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      account = app_label
    }
  }
}

########################################
#Deployment-reviews-v1
########################################

resource "kubernetes_deployment" "reviews_v1" {
  metadata {
    name = var.deployment_name_reviews_v1
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      app = var.app_label
      version = var.version_label_v1
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_label
        version = var.version_label_v1
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_label
          version = var.version_label_v1
        }
      }

      spec {
        service_account_name = var.service_account_name
        container {
          image = var.container_image
          name  = var.container_name
          image_pull_policy = var.image_pull_policy
          env {
            name = "LOG_DIR"
            value = "/tmp/logs"
          }
          port {
            container_port = var.container_port
          }

          volume_mount {
          name = "tmp"
          mount_path = "/tmp"
          }

          volume_mount {
          name = "wlp-output"
          mount_path = "/opt/ibm/wlp/output"
          }
         
        }

        volume {
        name = "wlp-output"
        empty_dir {
         
         }
        }

        volume {
        name = "tmp"
        empty_dir {
         
        }
      }
    }
  }
 }
}

########################################
#Deployment-reviews-v2
########################################

resource "kubernetes_deployment" "reviews_v2" {
  metadata {
    name = var.deployment_name_reviews_v2
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      app = var.app_label
      version = var.version_label_v2
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_label
        version = var.version_label_v2
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_label
          version = var.version_label_v2
        }
      }

      spec {
        service_account_name = var.service_account_name
        container {
          image = var.container_image
          name  = var.container_name
          image_pull_policy = var.image_pull_policy

          env {
            name = "LOG_DIR"
            value = "/tmp/logs"
          }
          port {
            container_port = var.container_port
          }
          volume_mount {
            name = "tmp"
            mount_path = "/tmp"
          }

          volume_mount {
            name = wlp-output
            mount_path = "/opt/ibm/wlp/output"
          }
        
          
        }
        volume {
          name = "wlp-output"
          empty_dir {
            
          }
        
        }
        volume {
          name = "tmp"
          empty_dir {
            
          }
      }
    }
  }
 }
}

########################################
#Deployment-reviews-v3
########################################

resource "kubernetes_deployment" "reviews_v3" {
  metadata {
    name = var.deployment_name_reviews_v3
    namespace = data.terraform_remote_state.namespace.outputs.namespace_name
    labels = {
      app = var.app_label
      version = var.version_label_v3
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_label
        version = var.version_label_v3
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_label
          version = var.version_label_v3
        }
      }

      spec {
        service_account_name = var.service_account_name
        container {
          image = var.container_image
          name  = var.container_name
          image_pull_policy = var.image_pull_policy
          env {
            name = "LOG_DIR"
            value = "/tmp/logs"
          }
          port {
            container_port = var.container_port
          }
          volume_mount {
            name = "tmp"
            mount_path = "/tmp"
          }

          volume_mount {
            name = "wlp-output"
            mount_path = "/opt/ibm/wlp/output"
          }
        
        }
        volume {
          name = "wlp-output"
          empty_dir {}
          
        }
        volume {
          name = "tmp"
          empty_dir {
            
          }
        }
      }
    }
  }
}