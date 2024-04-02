output "aws_ecr_repo_url" {
  value = aws_ecr_repository.repository.repository_url
}

output "aws_ecr_repo_arn" {
  value = aws_ecr_repository.repository.arn
}

output "github_iam_role_arn" {
  value = aws_iam_role.github_iam_role.arn
}

output "backend_iam_role_arn" {
  value = aws_iam_role.backend_iam_role.arn
}

output "aws_ecr_repo_name" {
  value = aws_ecr_repository.repository.name
}

output "aws_ecr_repo_id" {
  value = aws_ecr_repository.repository.id
}

output "aws_ecr_repo_registry_id" {
  value = aws_ecr_repository.repository.registry_id
}

