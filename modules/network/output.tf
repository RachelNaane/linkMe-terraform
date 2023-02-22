output "cluster_subnets" {
    value = concat([for subnet in aws_subnet.public-subnets : subnet.id], [for subnet in aws_subnet.private-subnets : subnet.id])
}

output "cluster_public_subnets" {
    value = [for subnet in aws_subnet.public-subnets : subnet.id]
}

output "cluster_private_subnets" {
    value = [for subnet in aws_subnet.private-subnets : subnet.id]
}