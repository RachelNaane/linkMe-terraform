output "cluster_subnets" {
    value = [for subnet in aws_subnet.public-subnets : subnet.id]
}