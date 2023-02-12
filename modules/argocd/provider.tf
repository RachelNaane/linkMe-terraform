terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.1"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = var.cluster.endpoint
    cluster_ca_certificate = base64decode(var.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster.name]
      command     = "aws"
    }
  }
}

# provider "kubernetes" {
#     host                   = var.cluster.endpoint
#     cluster_ca_certificate = base64decode(var.cluster.certificate_authority.0.data)
#     exec {
#         api_version = "client.authentication.k8s.io/v1alpha1"
#         args        = ["eks", "get-token", "--cluster-name", var.cluster.name]
#         command     = "aws"
#     }
# }