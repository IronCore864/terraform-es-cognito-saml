# cognito
variable "cognito_name" {
  type = string
}

# es
variable "domain" {
  type = string
}

# es network config
variable "vpc_id" {
  type = string
}

# the VPC CIDR which contains the subnets below
variable "vpc_cidr" {
  type = string
}

# for 2-az deploy, subnet id in az1
variable "az1_subnet_id" {
  type = string
}

# for 2-az deploy, subnet id in az2
variable "az2_subnet_id" {
  type = string
}

# for SAML auth
variable "saml_auth_metadata_url" {
  type = string
}

variable "sso_redirect_binding_uri" {
  type = string
}
