# Terraform EKS deploy

## Documentation

* [Kubernetes provider](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs)
* [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [EKS module](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)
* [EKS Release version](https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html)

## Requirements

* Terraform: `>= v0.15.0`
* Configure AWS account: `aws_access_key_id` and `aws_secret_access_key`
* The VPC must be exists
* The subnets must be exists
* Require `aws-iam-authenticator` ([how-to-install](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html))

## First steps!

1. Create bucket S3 to save `.tfstate`
2. Modify `config.tf` with properly `bucket` and `region`
3. Modify `eks.auto.tfvars` with your values
4. Install all dependencies and providers: `terraform init`
5. Deploy: `terraform apply`

## Files

* `config.tf`: providers, requirements and backend for Terraform
* `eks.auto.tfvars`: values for deployment
* `main.tf`: main file with EKS resource
* `outputs.tf`: output resources
* `variables.tf`: declare all variables with default values

## Default values

```bash
# EKS
## GENERAL
eks_cluster_name = "cluster-eks"
eks_version      = "1.19"
eks_type_workers = "t3a.micro"
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
```

## Tests

* (Average) Complete deployment: ~20 minutes
