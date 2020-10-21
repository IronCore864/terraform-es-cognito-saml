# ES domain name
variable "domain" {
  type = string
}

variable "vpc_id" {
  type = string
}

# the vpc CIDR range which contains az1 and az2 subnets
variable "vpc_cidr" {
  type = string
}

# for multi az deploy, the subnet id of az1
variable "az1_subnet_id" {
  type = string
}

# for multi az deploy, the subnet id of az2
variable "az2_subnet_id" {
  type = string
}

# default values for ES
variable "elasticsearch_version" {
  type    = string
  default = "7.7"
}

variable "instance_type" {
  type    = string
  default = "m5.large.elasticsearch"
}

variable "instance_count" {
  type    = number
  default = 2
}

# cognito
variable "user_pool_id" {
  type = string
}

variable "identity_pool_id" {
  type = string
}

variable "authenticated_role_arn" {
  type = string
}
