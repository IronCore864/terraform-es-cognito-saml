# Module for Cognito

Including user pool and identity pool, and SAML auth configured as identity provider.

## Usage Example

```
module "cognito" {
  source = "path/to/modules/cognito"

  domain                   = var.domain
  user_pool_name           = var.cognito_name
  identity_pool_name       = var.cognito_name
  saml_auth_metadata_url   = var.saml_auth_metadata_url
  sso_redirect_binding_uri = var.sso_redirect_binding_uri
}
```
