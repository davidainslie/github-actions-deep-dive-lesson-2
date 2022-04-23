output "github-actions-user-access-key" {
  value = aws_iam_access_key.github-actions-user-access.id
}

output "github-actions-user-secret-key" {
  # Careful - Cheating here to view sensitive data.
  value = nonsensitive(aws_iam_access_key.github-actions-user-access.secret)
}

output "preprod-website_endpoint" {
  value = aws_s3_bucket.preprod-bucket.website_endpoint
}

output "prod-website_endpoint" {
  value = aws_s3_bucket.prod-bucket.website_endpoint
}