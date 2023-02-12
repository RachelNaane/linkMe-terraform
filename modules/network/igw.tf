resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
      Name = "rachel-naane-portfolio-igw-${var.env_name}"
    }
}