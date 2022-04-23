# terraform apply -var-file="secrets.tfvars"
# terraform destroy -var-file="secrets.tfvars"

resource "aws_s3_bucket" "preprod-bucket" {
  bucket = "preprod-bucket-da"
  force_destroy = true
}

resource "aws_s3_bucket" "prod-bucket" {
  bucket = "prod-bucket-da"
  force_destroy = true
}

data "aws_iam_policy" "s3-full-access-policy" {
  name = "AmazonS3FullAccess"
}

resource "aws_iam_user" "github-actions-user" {
  name = "github-actions-user"
  path = "/"
}

resource "aws_iam_user_policy_attachment" "s3-policy-attachment" {
  user       = aws_iam_user.github-actions-user.name
  policy_arn = data.aws_iam_policy.s3-full-access-policy.arn
}

resource "aws_iam_access_key" "github-actions-user-access" {
  user    = aws_iam_user.github-actions-user.name
}