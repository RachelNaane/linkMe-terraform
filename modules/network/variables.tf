variable "env_name" {
    type = string
}

variable "vpc_cidr_block" {
    type = string
}

variable "public_subnets_cidr_blocks_and_AZs" {
    type = map(string)
}

variable "private_subnets_cidr_blocks_and_AZs" {
    type = map(string)
    default = null
}

variable "map_public_ip_on_launch" {
    type = bool
}

variable "cluster_name" {
    type = string
}