locals {
  account-id = data.aws_caller_identity.current.account_id
}

data "aws_iam_policy_document" "ecr_repo_policy" {
  
  statement {
    sid    = var.sid_org_can_pull
    effect = var.effect_org_can_pull
    principals {
      type        = var.principal_type_org_can_pull
      identifiers = var.principal_identifiers_org_can_pull
    }
    actions = var.ecr_actions_org_can_pull
    condition {
      test     = var.condition_test
      variable = var.condition_variable
      values   = var.condition_values
    }
  }
  
  statement {
    sid    = var.sid_github_actions_can_push
    effect = var.effect_github_actions_can_push
    principals {
      type        = var.principal_type_github_actions_can_push
      identifiers = var.principal_identifiers_github_actions_can_push
    }
    actions = var.ecr_actions_github_actions_can_push
    condition {
      test     = var.condition_test
      variable = var.condition_variable
      values   = var.condition_values
    }
  }
}

data "aws_ecr_repository" "existing_repo" {
  name = "terraform-demo-repo"
}
