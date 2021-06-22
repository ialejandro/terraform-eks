# EKS
## GENERAL
eks_cluster_name = "cluster-eks"
eks_version      = "1.19"
eks_type_workers = "t3a.small"
eks_nr_workers   = 3

## WORKERS
eks_worker_volume_size = 100

# NETWORK
vpc_id = "vpc-74865e0d"
subnets_id = [
  "subnet-fcf9f39a",
  "subnet-27da3f6c",
  "subnet-6099ce3a"
]