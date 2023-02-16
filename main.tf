terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "rachel-naane-portfolio-state-files"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "rachel-naane-terraform-state-locking"
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  env_name = terraform.workspace
}

module "eks" {
  source = "./modules/eks"

  env_name = terraform.workspace
  nodes_subnets = module.network.cluster_subnets
  cluster_subnets = module.network.cluster_subnets
}

module "argocd" {
  source = "./modules/argocd"

  env_name = terraform.workspace
  cluster = module.eks.cluster
}