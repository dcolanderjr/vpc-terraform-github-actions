data "aws_instances" "all" {
  instance_tags = var.instance_tags
}