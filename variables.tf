variable "aws_region" {
    type = string
}

//module.network vars
variable "vpc_cidr_block" {
    type = string
}

variable "public_subnets_cidr_blocks_and_AZs" {
    type = map(string)
}

variable "map_public_ip_on_launch" {
    type = bool
}

variable "cluster_name" {
    type = string
}

//module.efk vars
variable "nodes_desired_size" {
    type = number
}

variable "nodes_max_size" {
    type = number
}

variable "nodes_min_size" {
    type = number
}

variable "nodes_type" {
    type = string
}

//module.argocd vars
variable "region" {
    type = string
    default = "eu-west-2"
}
