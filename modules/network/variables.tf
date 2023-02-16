variable "env_name" {
    type = string
}

variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/20"
}

variable "public_subnets_cidr_blocks_and_AZs" {
    type = map(string)
    default = {
        "10.0.0.0/22" = "eu-west-2a"
        "10.0.4.0/22" = "eu-west-2b"
        "10.0.8.0/22" = "eu-west-2a"
        "10.0.12.0/22" = "eu-west-2b"
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