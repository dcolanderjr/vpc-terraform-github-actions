data "terraform_remote_state" "alb" {
  backend = "s3"
  
  config = var.config

    outputs = {
        target_group_arn = "target_group_arn"
    }
}
