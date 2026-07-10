module "vpc" {
    source = "./modules/01-vpc"
}

module "ecs" {
    source = "./modules/03-ecs"

    target_group_arn = module.alb.target_group
    
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.public_subnets
    security_group = module.vpc.ecs_security_group_id
}

module "alb" {
    source = "./modules/04-alb"
  
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.public_subnets
    security_group = module.vpc.ecs_security_group_id
}

module "acm" {
    source = "./modules/05-acm"

    domain_name = var.domain_name
    subdomain = var.subdomain
    zone_id = var.zone_id
}