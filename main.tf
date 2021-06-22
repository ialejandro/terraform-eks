data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source             = "terraform-aws-modules/eks/aws"
  cluster_name       = var.eks_cluster_name
  cluster_version    = var.eks_version
  subnets            = var.subnets_id
  vpc_id             = var.vpc_id
  config_output_path = pathexpand("~/.kube/kubeconfig-${var.eks_cluster_name}")

  worker_groups = [
    {
      instance_type = var.eks_type_workers
      asg_max_size  = var.eks_nr_workers
    }
  ]

  workers_group_defaults = {
    volume_size      = var.eks_worker_volume_size
    root_volume_type = var.eks_worker_volume_type
  }

  tags = {
    iac = "terraform"
  }
}