# 01-vpc
module "vpc" {
    source         = "terraform-aws-modules/vpc/aws"

    name           = "code-server"
    cidr           = "10.0.0.0/22"

    azs            = ["us-east-1a", "us-east-1b", "us-east-1c"]
    public_subnets = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

    enable_nat_gateway = false
    single_nat_gateway = false

    enable_dns_support   = true
    enable_dns_hostnames = true

    map_public_ip_on_launch = true

    tags = {
        Terraform  = true 
        Environment = "dev"
    }
}