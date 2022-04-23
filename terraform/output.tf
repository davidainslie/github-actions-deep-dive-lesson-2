output "github-actions-user-access-key" {
  value = aws_iam_access_key.github-actions-user-access.id
}

output "github-actions-user-secret-key" {
  # Careful - Cheating here to view sensitive data.
  value = nonsensitive(aws_iam_access_key.github-actions-user-access.secret)
}