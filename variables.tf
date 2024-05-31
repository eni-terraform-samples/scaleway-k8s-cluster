variable "cluster_name" {
  type        = string
  description = "the name of the cluster to create"
}

variable "node_count" {
  type        = number
  description = "number of instances to create in the cluster node pool"
  default     = 1

  validation {
    condition     = var.node_count > 0
    error_message = "Node count should be greater than 0"
  }
}

variable "node_type" {
  type        = string
  description = "the type of node to create in the cluster node pool"
  default     = "DEV1-M"
}
