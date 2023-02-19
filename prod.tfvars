//main vars
aws_region = "eu-west-2"

//network vars
vpc_cidr_block = "10.0.0.0/20"
public_subnets_cidr_blocks_and_AZs = {
        "10.0.0.0/22" = "eu-west-2a"
        "10.0.4.0/22" = "eu-west-2b"
        "10.0.8.0/22" = "eu-west-2a"
        "10.0.12.0/22" = "eu-west-2b"
    }
map_public_ip_on_launch=true
cluster_name="rachel-naane-portfolio-cluster"

//eks vars
nodes_desired_size = 2
nodes_max_size = 3
nodes_min_size = 1
nodes_type = "t3a.xlarge"

//argocd vars
region = "eu-west-2"