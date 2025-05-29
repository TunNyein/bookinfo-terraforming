variable "service_name" {
  type        = string
  description = "Name of the service"
  default     = "reviews"
}


variable "app_label" {
  type        = string
  description = "Name of the app_label"
  default     = "reviews"
}

variable "container_port" {
  type        = number
  description = "Name of the container_port"
  default     = 9080
}

variable "service_account_name" {
  type        = string
  description = "Name of the service_account"
  default     = "reviews"
}

variable "container_name" {
  type        = string
  description = "Name of the container_name"
  default     = "reviews"
}


variable "deployment_name_reviews_v1" {
  type        = string
  description = "Name of the deployment_name"
  default     = "reviews-v1"
}

variable "deployment_name_reviews_v2" {
  type        = string
  description = "Name of the deployment_name"
  default     = "reviews-v2"
}

variable "deployment_name_reviews_v3" {
  type        = string
  description = "Name of the deployment_name"
  default     = "reviews-v3"
}

variable "version_label_v1" {
  type        = string
  description = "Name of the Version"
  default     = "v1"
}

variable "version_label_v2" {
  type        = string
  description = "Name of the Version"
  default     = "v2"
}

variable "version_label_v3" {
  type        = string
  description = "Name of the Version"
  default     = "v3"
}



variable "replicas" {
  type        = number
  description = "Number of the replicas"
  default     = 1
}

variable "container_image" {
  type        = string
  description = "Name of the container_image"
  default     = "docker.io/istio/examples-bookinfo-reviews-v1:1.20.3"
}

variable "image_pull_policy" {
  type        = string
  description = "Image pull policy"
  default     = "IfNotPresent"
}