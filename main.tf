module "cognito" {
  source = "../modules/cognito"

  domain                   = var.domain
  user_pool_name           = var.cognito_name
  identity_pool_name       = var.cognito_name
  saml_auth_metadata_url   = var.saml_auth_metadata_url
  sso_redirect_binding_uri = var.sso_redirect_binding_uri
}

module "elk" {
  source = "../modules/es"

  domain = var.domain

  vpc_id        = var.vpc_id
  vpc_cidr      = var.vpc_cidr
  az1_subnet_id = var.az1_subnet_id
  az2_subnet_id = var.az2_subnet_id

  user_pool_id           = module.cognito.user_pool_id
  identity_pool_id       = module.cognito.identity_pool_id
  authenticated_role_arn = module.cognito.authenticated_role_arn
}
