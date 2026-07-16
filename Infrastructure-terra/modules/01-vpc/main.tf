module "vpc" {
    source         = "terraform-aws-modules/vpc/aws"
    version        = "5.8.1"

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

resource "aws_security_group" "this" {
  name   = "code-server-terra-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    # security_groups = [
    #   var.alb_security_group_id
    # ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}