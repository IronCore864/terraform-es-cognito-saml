resource "aws_kms_key" "kms" {
  description = "KMS key for ES domain ${var.domain}"
}
