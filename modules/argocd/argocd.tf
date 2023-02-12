resource "helm_release" "argocd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.20.3"
  namespace  = "argocd"
  create_namespace = true

  values = [
    file("${path.module}/argocd-values.yaml")
  ]
}

# resource "kubernetes_namespace" "argocd" {
#   metadata {
#     name = "argocd"
#   }
# }

# resource "argocd_repository" "private" {
#   repo            = "git@private-git-repository.local:somerepo.git"
#   username        = "git"
#   ssh_private_key = "-----BEGIN OPENSSH PRIVATE KEY-----\nfoo\nbar\n-----END OPENSSH PRIVATE KEY-----"
#   insecure        = true
# }

# resource "kubernetes_manifest" "application" {
#     manifest = yamldecode(file("${path.module}/app-of-apps.yaml"))
# }