resource "aws_cognito_user_pool" "main" {
  name = var.user_pool_name

  schema {
    name                     = "email"
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    required                 = true
    string_attribute_constraints {
      min_length = 0
      max_length = 64
    }
  }
}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = "azdir-${var.domain}"
  user_pool_id = aws_cognito_user_pool.main.id
}

resource "aws_cognito_identity_provider" "saml" {
  user_pool_id  = aws_cognito_user_pool.main.id
  provider_name = "SAML"
  provider_type = "SAML"

  provider_details = {
    MetadataURL           = var.saml_auth_metadata_url
    SSORedirectBindingURI = var.sso_redirect_binding_uri
  }

  attribute_mapping = {
    email = "email"
  }
}

resource "aws_cognito_identity_pool" "main" {
  identity_pool_name               = var.identity_pool_name
  allow_unauthenticated_identities = true
}
