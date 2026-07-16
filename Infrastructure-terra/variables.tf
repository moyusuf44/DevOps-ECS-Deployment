variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/22"
}

variable "domain_name" {
  type        = string
}

variable "subdomain" {
  type        = string
}

variable "zone_id" {
  type        = string
}

variable "cloudflare_api_token" {
  type        = string
}

variable "zone_name" {
  type        = string 
  description = "Cloudflare DNS zone name"
}

variable "vpc_id" {
  type = string 
}