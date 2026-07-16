variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

# variable "security_group" {
#   type = string
# }

variable "certificate_arn" {
  type = string
}

