# variable "kubeconfig_path" {
#   description = "Path to Kubernetes config file"
#   type        = string
#   default     = "~/.kube/config-vagrant"
# }

variable "service_name" {
  type        = string
  description = "Name of the service"
  default     = "details"
}

variable "service_account_name" {
  type        = string
  description = "Name of the service account"
  default     = "details"
}

variable "deployment_name" {
  type        = string
  description = "deployment name of bookinfo-details microservcies "
  default = "details-v1"
}

variable "app_label" {
  type        = string
  description = "app label of bookinfo-details microservcies "
  default = "details"
}

variable "version_label" {
  type        = string
  description = "version label of bookinfo-details microservcies "
  default = "v1"
}

variable "replicas" {
  type        = number
  description = "number of replicas of bookinfo-details microservcies "
  default = "1"
}


variable "container_image" {
  type        = string
  description = "Container image"
  default     = "docker.io/istio/examples-bookinfo-details-v1:1.20.3"
}

variable "container_name" {
  type        = string
  description = "Container name"
  default     = "details"
}

variable "container_port" {
  type        = number
  description = "Container port"
  default     = 9080
}

variable "image_pull_policy" {
  type        = string
  description = "Image pull policy"
  default     = "IfNotPresent"
}