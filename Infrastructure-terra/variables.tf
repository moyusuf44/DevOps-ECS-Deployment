variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/22"
}

variable "domain_name" {
  type = string
}

variable "subdomain" {
  type = string
}

variable "zone_id" {
  type = string
}