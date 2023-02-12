resource "aws_eip" "nat_ip" {
    vpc = true

    tags = {
        Name = "rachel-naane-nat-ip-${var.env_name}"
    }
}

locals {
    subnet_keys = keys(var.public_subnets_cidr_blocks_and_AZs)
    subnet_key = local.subnet_keys[0]
}

resource "aws_nat_gateway" "nat" {
    allocation_id   = aws_eip.nat_ip.id
    subnet_id       = aws_subnet.public-subnets[local.subnet_key].id

    tags = {
        Name = "rachel-naane-nat-${var.env_name}"
    }

    depends_on = [aws_internet_gateway.igw]
}