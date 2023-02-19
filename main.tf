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
  vpc_cidr_block = var.vpc_cidr_block
  public_subnets_cidr_blocks_and_AZs = var.public_subnets_cidr_blocks_and_AZs
  map_public_ip_on_launch=var.map_public_ip_on_launch
  cluster_name=var.cluster_name
}

module "eks" {
  source = "./modules/eks"

  env_name = terraform.workspace
  nodes_subnets = module.network.cluster_subnets
  cluster_subnets = module.network.cluster_subnets
  cluster_name = var.cluster_name
  nodes_desired_size = var.nodes_desired_size
  nodes_max_size = var.nodes_max_size
  nodes_min_size = var.nodes_min_size
  nodes_type = var.nodes_type
}

module "argocd" {
  source = "./modules/argocd"

  env_name = terraform.workspace
  cluster = module.eks.cluster
  region = "eu-west-2"
}