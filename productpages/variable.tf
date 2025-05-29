variable "service_name" {
  type        = string
  description = "Name of the service"
  default     = "productpage"
}


variable "app_label" {
  type        = string
  description = "Name of the app_label"
  default     = "productpage"
}

variable "container_port" {
  type        = number
  description = "Name of the container_port"
  default     = 9080
}

variable "container_name" {
  type        = string
  description = "Name of the container_name"
  default     = "productpage"
}

variable "service_account_name" {
  type        = string
  description = "Name of the service_account_name"
  default     = "productpage"
}

variable "deployment_name" {
  type        = string
  description = "Name of the deployment_name"
  default     = "productpage"
}

variable "version_label" {
  type        = string
  description = "Name of the Version"
  default     = "v1"
}

variable "replicas" {
  type        = number
  description = "Number of the replicas"
  default     = 1
}

variable "container_image" {
  type        = string
  description = "Name of the container_image"
  default     = "docker.io/istio/examples-bookinfo-productpage-v1:1.20.3"
}

variable "image_pull_policy" {
  type        = string
  description = "Image pull policy"
  default     = "IfNotPresent"
}