resource "aws_eip" "eip" {
    count = var.private_subnets_cidr_blocks_and_AZs != null ? 1 : 0

    vpc = true

    tags = {
      Name = "rachel-naane-eip-${var.env_name}"
    }
}

resource "aws_nat_gateway" "nat" {
    count = var.private_subnets_cidr_blocks_and_AZs != null ? 1 : 0

    allocation_id = aws_eip.eip[count.index].id
    subnet_id     = aws_subnet.public-subnets[count.index].id

    tags = {
      Name = "rachel-naane-nat-${var.env_name}"
    }

    depends_on = [aws_internet_gateway.igw]
}