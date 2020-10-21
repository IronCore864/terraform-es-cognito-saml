resource "aws_elasticsearch_domain" "es" {
  domain_name           = var.domain
  elasticsearch_version = var.elasticsearch_version

  cluster_config {
    instance_type          = var.instance_type
    instance_count         = var.instance_count
    zone_awareness_enabled = true
  }

  vpc_options {
    subnet_ids = [
      var.az1_subnet_id,
      var.az2_subnet_id,
    ]

    security_group_ids = [aws_security_group.es.id]
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = "20"
  }

  encrypt_at_rest {
    enabled    = true
    kms_key_id = aws_kms_key.kms.id
  }

  cognito_options {
    enabled          = true
    user_pool_id     = var.user_pool_id
    identity_pool_id = var.identity_pool_id
    role_arn         = aws_iam_role.cognito_for_es.arn
  }

  snapshot_options {
    automated_snapshot_start_hour = 23
  }

  tags = {
    Domain = var.domain
  }
}
