# terraform apply -var-file="secrets.tfvars"
# terraform destroy -var-file="secrets.tfvars"

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  force_destroy = true
}

data "aws_iam_policy" "s3-full-access-policy" {
  name = "AmazonS3FullAccess"
}

data "aws_iam_policy" "lambda-full-access-policy" {
  name = "AWSLambda_FullAccess"
}

resource "aws_iam_user" "github-actions-user" {
  name = "github-actions-user"
  path = "/"
}

resource "aws_iam_user_policy_attachment" "s3-policy-attachment" {
  user       = aws_iam_user.github-actions-user.name
  policy_arn = data.aws_iam_policy.s3-full-access-policy.arn
}

resource "aws_iam_user_policy_attachment" "lambda-policy-attachment" {
  user       = aws_iam_user.github-actions-user.name
  policy_arn = data.aws_iam_policy.lambda-full-access-policy.arn
}

resource "aws_iam_access_key" "github-actions-user-access" {
  user    = aws_iam_user.github-actions-user.name
}

resource "aws_iam_role" "my-lambda-role" {
  name   = "my-lambda-role"

  assume_role_policy = <<-EOT
  {
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Sid": "",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }]
  }
  EOT
}

/*
resource "aws_lambda_function" "my-function" {
  function_name = "my-function"
  filename      = "${path.module}/python/hello-python.zip"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.my-lambda-role.arn
}
*/
