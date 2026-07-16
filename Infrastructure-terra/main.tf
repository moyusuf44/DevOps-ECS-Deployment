module "vpc" {
    source = "./modules/01-vpc"
 
}

module "ecs" {
    source = "./modules/03-ecs"

    target_group_arn = module.alb.target_group
    
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.public_subnets
    security_group = module.vpc.ecs_security_group_id
    alb_security_group_id = module.alb.alb_security_group_id
}

module "alb" {  
    source = "./modules/04-alb"
  
    vpc_id = var.vpc_id
    subnet_ids = module.vpc.public_subnets
    #security_group = module.vpc.ecs_security_group
    #security_group = module.vpc.alb_security_group_id
    certificate_arn = module.acm.certificate_arn
}

module "acm" {
    source = "./modules/05-acm"

    domain_name = var.domain_name
    subdomain = var.subdomain
    zone_id = var.zone_id
}

module "cloudflare" {
    source = "./modules/06-cloudflare"

    zone_name = var.zone_name
    domain_validation_options = module.acm.domain_validation_options
    alb_dns_name = module.alb.alb_dns_name
   
}

resource "aws_acm_certificate_validation" "this" {
    certificate_arn = module.acm.certificate_arn
    validation_record_fqdns = module.cloudflare.validation_record_fqdns
}