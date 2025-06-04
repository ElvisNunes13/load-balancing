resource "aws_eks_cluster" "this" {
  name = "cluster-name"

  role_arn = aws_iam_role.eks_cluster.arn
  version  = "1.33"

  enabled_cluster_log_types = [
    "audit",
    "api",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  vpc_config {
    subnet_ids = aws_subnet.private[*].id
  }

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
  ]
}