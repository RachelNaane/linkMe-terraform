variable "env_name" {
    type = string
}

variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/24"
}

variable "public_subnets_cidr_blocks_and_AZs" {
    type = map(string)
    default = {
        "10.0.0.0/28" = "eu-west-2a"
        "10.0.0.16/28" = "eu-west-2b"
    }
}

variable "private_subnets_cidr_blocks_and_AZs" {
    type = map(string)
    default = {
        "10.0.0.32/28" = "eu-west-2a"
        "10.0.0.48/28" = "eu-west-2b"
    }
}

variable "map_public_ip_on_launch" {
    type = bool
    default = true
}

variable "cluster_name" {
    type = string
    default = "rachel-naane-portfolio-cluster"
}