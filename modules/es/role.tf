resource "aws_iam_role" "cognito_for_es" {
  name = "CognitoAccessForAmazonES"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "es.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "es_cognito_managed_policy" {
  role       = aws_iam_role.cognito_for_es.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonESCognitoAccess"
}

data "aws_iam_policy_document" "cognito" {
  statement {
    actions = [
      "ec2:DescribeVpcs",
      "cognito-identity:ListIdentityPools",
      "cognito-idp:ListUserPools"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "iam:GetRole",
      "iam:PassRole"
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/CognitoAccessForAmazonES"
    ]
  }
}

resource "aws_iam_role_policy" "example" {
  name   = "cognito_self_managed_policy"
  role   = aws_iam_role.cognito_for_es.id
  policy = data.aws_iam_policy_document.cognito.json
}
