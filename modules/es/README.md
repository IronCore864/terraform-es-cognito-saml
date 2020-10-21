# Module for ElasticSearch Service in AWS

Including:

- ElasticSearch Domain
- ElasticSearch Domain Policy
- KMS key (used for encryption at rest)
- IAM role (so that ES can access Cognito for Kibana-Cognito integration with SAML auth)
- Security group for the ElasticSearch service

## Usage Example

```
module "elk" {
  source = "path/to/modules/es"

  domain = var.domain

  vpc_id        = var.vpc_id
  vpc_cidr      = var.vpc_cidr
  az1_subnet_id = var.az1_subnet_id
  az2_subnet_id = var.az2_subnet_id

  user_pool_id           = module.cognito.user_pool_id
  identity_pool_id       = module.cognito.identity_pool_id
  authenticated_role_arn = module.cognito.authenticated_role_arn
}
```
