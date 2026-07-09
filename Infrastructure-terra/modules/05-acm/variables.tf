variable "domain_name" {
    description = "Domain Name"
    type = string 
}

variable "subdomain" {
    description = "Subdomain (tm)"
    type = string
}

variable "zone_id" {
    description = "Route 53 hosted zone ID"
    type = string 
}
