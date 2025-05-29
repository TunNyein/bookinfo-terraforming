variable "service_name" {
  type        = string
  description = "Name of the service"
  default     = "ratings"
}


variable "app_label" {
  type        = string
  description = "Name of the app_label"
  default     = "ratings"
}

variable "container_port" {
  type        = number
  description = "Name of the container_port"
  default     = 9080
}

variable "service_account_name" {
  type        = string
  description = "Name of the service_account"
  default     = "ratings"
}

variable "container_name" {
  type        = string
  description = "Name of the container_name"
  default     = "ratings"
}


variable "deployment_name" {
  type        = string
  description = "Name of the deployment_name"
  default     = "ratings"
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
  default     = "docker.io/istio/examples-bookinfo-ratings-v1:1.20.3"
}

variable "image_pull_policy" {
  type        = string
  description = "Image pull policy"
  default     = "IfNotPresent"
}