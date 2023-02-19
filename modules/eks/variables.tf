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
}

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