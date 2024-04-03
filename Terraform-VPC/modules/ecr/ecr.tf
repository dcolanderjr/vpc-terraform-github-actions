data "aws_caller_identity" "current" {}

# tfsec:ignore:aws-ecr-repository-customer-key
resource "aws_ecr_repository" "repository" {
  count                = var.create_ecr_repository
  name                 = var.repository_name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  encryption_configuration {
    encryption_type = var.encryption_type
  }

  lifecycle {
    prevent_destroy = true

  }
}

resource "aws_ecr_lifecycle_policy" "name" {
  repository = aws_ecr_repository.repository.name
  policy     = file("${path.module}/policy.json")
}

resource "aws_ecr_registry_scanning_configuration" "scan_configuration" {
  scan_type = var.scan_type

  rule {
    scan_frequency = var.scan_frequency

    repository_filter {
      filter      = var.repository_filter
      filter_type = var.filter_type
    }
  }
}

resource "aws_iam_role" "backend_iam_role" {
  name               = var.backend_iam_role
  assume_role_policy = var.backend_assume_role_policy
}

resource "aws_iam_role" "github_iam_role" {
  name               = var.github_iam_role
  assume_role_policy = var.github_assume_role_policy
}

