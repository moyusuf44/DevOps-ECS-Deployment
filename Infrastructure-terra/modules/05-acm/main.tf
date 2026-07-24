resource "aws_acm_certificate" "this" {
  domain_name = var.domain_name

  subject_alternative_names = [
    "${var.subdomain}.${var.domain_name}"
  ]

  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

data "cloudflare_zone" "this" {
  filter = {
    name = var.domain_name
  }
}

# resource "cloudflare_record" "validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.this.domain_validation_options :
#     dvo.domain_name => dvo
#   }

#   zone_id = data.cloudflare_zone.this.id

#   name  = each.value.resource_record_name
#   type  = each.value.resource_record_type
#   value = each.value.resource_record_value
#   ttl   = 60
# }

