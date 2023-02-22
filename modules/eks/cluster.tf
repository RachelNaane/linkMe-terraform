resource "aws_iam_role" "eks" {
  name = "${var.cluster_name}-${var.env_name}"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

//policy to manage EKS cluster-creating/deleting worker nodes, managing the Kubernetes API server, configuring CloudWatch metrics and logs.
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}

resource "aws_eks_cluster" "cluster" {
  name     = "${var.cluster_name}-${var.env_name}"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = var.cluster_subnets
  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}