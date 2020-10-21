# Terraform Automation for ElasticSearch in AWS with Cognito SAML Auth

Everything you need to setup ElasticSearch service in AWS, including:

- Cognito: setting up the user pool, identity pool, as well as an SAML identity provider;
- ElasticSearch service itself, including access policy and Cognito integration for authentication;
- 2-availability-zone deploy for ElasticSearch itself for better availability;
- related IAM roles for ES to access Cognito; related IAM roles for Cognito for authed/unauthed users; security groups; etc.

Terraform 0.13 is required.

## Variables

Update values in file `terraform.tfvars` accordingly.

Regarding the usage of each variable, see comments in file `variables.tf`.

## Deploy

```
terraform init
terraform apply
```

## Configuration after Deployment

Due to limitations of Cognito user pool, there is one manual step after the `terraform apply` has finished, describing as follows:

- Go to AWS Console and search for Cognito;
- On the Cognito service page, click "Manage User Pools";
- Select the user pool created by the above terraform script;
- Click "App client settings" from the navigation bar on the left;
- In the list of Enabled Identity Providers, select the SAML identity provider.

## Read More

If you are interested in how everything is working behind the automation, see [here](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-cognito-auth.html).
