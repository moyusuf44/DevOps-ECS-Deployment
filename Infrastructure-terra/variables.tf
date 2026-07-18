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

variable "code_server_password" {
  type = string 
  sensitive = true 
}

variable "cluster_name" {
  type = string
}

variable "image_id" {
  type = string 
}

variable "region_id" {
  type = string 
}

variable "cpu" {
  type = string 
}

variable "memory" {
  type = string 
}

variable "desired_count" {
  type = string 
}

variable "health_check_path" {
  type = string 
}