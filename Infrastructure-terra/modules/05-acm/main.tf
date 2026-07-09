resource "aws_acm_certificate" "" {
    domain_name = "${var.subdomain}.${var.domain_name}"
    validation_method = "DNS"

    lifecycle {
        create_before_destroy = true 
    }
}

resource "aws_route53_record" "validation" {
    for_each {
        for dvo in aws_acm_certificate.this.domain_validation_options:
        dvo.domain_name => dvo   #allows multiple domains to be used by same acm cert
    }
    
    zone_id = var.zone_id

    name = "each.value.record_resource_name"
    type = "each.value.record_resource_type"
    ttl = 60
    records = [each.value.record_resource_value]
}