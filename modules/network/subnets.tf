resource "aws_subnet" "public-subnets" {
    for_each = var.public_subnets_cidr_blocks_and_AZs

    vpc_id            = aws_vpc.vpc.id
    cidr_block        = each.key
    availability_zone = each.value
    map_public_ip_on_launch = var.map_public_ip_on_launch
    
    tags = {
      Name = "rachel-naane-portfolio-public-subnet-${each.key}-${var.env_name}"
      "kubernetes.io/role/elb" = "1"
      "kubernetes.io/cluster/${var.cluster_name}-${var.env_name}" = "owned"
    }
}