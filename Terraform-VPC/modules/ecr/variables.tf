variable "effect_org_can_pull" {
  type        = string
  description = "Effect for the statement allowing all accounts in the Org to pull"
}

variable "effect_github_actions_can_push" {
  type        = string
  description = "Effect for the statement allowing GitHub Actions to push"
}

variable "sid_org_can_pull" {
  type        = string
  description = "SID for the statement allowing all accounts in the Org to pull"
}

variable "sid_github_actions_can_push" {
  type        = string
  description = "SID for the statement allowing GitHub Actions to push"
}

variable "ecr_actions_org_can_pull" {
  type        = list(string)
  description = "List of ECR actions for which all accounts in the Org can pull"
}

variable "ecr_actions_github_actions_can_push" {
  type        = list(string)
  description = "List of ECR actions for which GitHub Actions can push"
}

variable "principal_type_org_can_pull" {
  type        = string
  description = "Type of principal for the statement allowing all accounts in the Org to pull"
}

variable "principal_identifiers_org_can_pull" {
  type        = list(string)
  description = "List of principal identifiers for the statement allowing all accounts in the Org to pull"
}

variable "principal_type_github_actions_can_push" {
  type        = string
  description = "Type of principal for the statement allowing GitHub Actions to push"
}

variable "principal_identifiers_github_actions_can_push" {
  type        = list(string)
  description = "List of principal identifiers for the statement allowing GitHub Actions to push"
}

variable "condition_test" {
  type        = string
  description = "Condition test"
}

variable "condition_variable" {
  type        = string
  description = "Condition variable"
}

variable "condition_values" {
  type        = list(string)
  description = "List of condition values"
}

variable "iam_role" {
  type        = string
  description = "IAM role for GitHub Actions"
}

variable "repository_name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "image_tag_mutability" {
  type        = string
  description = "Image tag mutability for the ECR repository"
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  type        = bool
  description = "Enable scan on push for the ECR repository"
  default     = true
}

variable "encryption_type" {
  type        = string
  description = "Encryption type for the ECR repository"
  default     = "KMS"
}

variable "lifecycle_policy_file" {
  type        = string
  description = "Path to the ECR repository lifecycle policy file"
}

variable "scan_type" {
  type        = string
  description = "Scan type for the ECR registry scanning configuration"
  default     = "ENHANCED"
}

variable "scan_frequency" {
  type        = string
  description = "Scan frequency for the ECR registry scanning configuration"
  default     = "CONTINUOUS_SCAN"
}

variable "repository_filter" {
  type        = string
  description = "Repository filter for the ECR registry scanning configuration"
  default     = "*"
}

variable "filter_type" {
  type        = string
  description = "Filter type for the ECR registry scanning configuration"
  default     = "WILDCARD"
}

variable "github_iam_role" {
  type        = string
  description = "IAM role for GitHub Actions"
}

variable "backend_iam_role" {
  type        = string
  description = "IAM role for the backend service"
}

variable "backend_assume_role_policy" {
  type        = string
  description = "Assume role policy for the backend service"
}

variable "github_assume_role_policy" {
  type        = string
  description = "Assume role policy for GitHub Actions"
}