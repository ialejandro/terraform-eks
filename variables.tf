# EKS
## GENERAL
variable "eks_cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources"
  type        = string
  default     = "cluster-eks"
}

variable "eks_version" {
  description = "Kubernetes version to use for the EKS cluster"
  type        = string
  default     = "1.19"
}

variable "eks_type_workers" {
  description = "The instance type"
  type        = string
  default     = "t3a.small"
}

variable "eks_nr_workers" {
  description = "The number of nodes"
  type        = number
  default     = 3
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
  default     = "eu-west-1"
}

## WORKERS
variable "eks_worker_volume_size" {
  description = "The size disk"
  type        = number
  default     = 100
}

variable "eks_worker_volume_type" {
  description = "The type of disk"
  type        = string
  default     = "gp3"
}

# NETWORK
variable "vpc_id" {
  description = "VPC where the cluster and workers will be deployed"
  type        = string
}

variable "subnets_id" {
  description = "A list of subnets to place the EKS cluster and workers within"
  type        = list(string)
}
