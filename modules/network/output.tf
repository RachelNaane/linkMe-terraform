locals {
    private_subnets = values(aws_subnet.private-subnets)
    public_subnets = values(aws_subnet.public-subnets)
    subnets = concat(
        local.private_subnets,
        local.public_subnets
    )

    cluster_subnets = [for subnet in local.subnets : subnet.id]
    nodes_private_subnets = [for subnet in local.private_subnets : subnet.id]
}

output "cluster_subnets" {
    value = local.cluster_subnets
}

output "nodes_subnets" {
    value = local.nodes_private_subnets
}