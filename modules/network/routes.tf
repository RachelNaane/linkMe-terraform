//public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block                 = "0.0.0.0/0"
    gateway_id                 = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rachel-naane-public-routtable-${var.env_name}"
  }
}

resource "aws_route_table_association" "public" {
    for_each        = aws_subnet.public-subnets
    subnet_id      = aws_subnet.public-subnets[each.key].id
    route_table_id = aws_route_table.public.id
}

//private subnets
resource "aws_route_table" "private" {
  count = var.private_subnets_cidr_blocks_and_AZs != null ? 1 : 0

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block                 = "0.0.0.0/0"
    nat_gateway_id             = aws_nat_gateway.nat[0].id
  }

  tags = {
    Name = "rachel-naane-private-routtable-${var.env_name}"
  }
}

resource "aws_route_table_association" "private" {
    for_each = var.private_subnets_cidr_blocks_and_AZs != null ? var.private_subnets_cidr_blocks_and_AZs : {}
    subnet_id      = aws_subnet.private-subnets[each.key].id
    route_table_id = aws_route_table.private[0].id
}