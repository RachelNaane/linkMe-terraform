variable "env_name" {
    type = string
}

variable "cluster_subnets" {
  type = list(string)
}

variable "nodes_subnets" {
  type = list(string)
}

variable "cluster_name" {
    type = string
    default = "rachel-naane-portfolio-cluster"
}

variable "nodes_desired_size" {
    type = number
    default = 2
}

variable "nodes_max_size" {
    type = number
    default = 3
}

variable "nodes_min_size" {
    type = number
    default = 1
}

variable "nodes_type" {
    type = string
    default = "t3a.xlarge"
}