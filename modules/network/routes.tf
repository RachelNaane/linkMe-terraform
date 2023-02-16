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