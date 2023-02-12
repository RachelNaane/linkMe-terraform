resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block

    tags = {
        Name = "rachel-naane-portfolio-vpc-${var.env_name}"
    }
}