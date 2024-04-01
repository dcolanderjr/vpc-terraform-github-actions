data "aws_ami" "ami_provider" {
  most_recent = var.ami_most_recent
  owners      = var.ami_owners

  filter {
    name   = "name"
    values = [var.ami_name_pattern]
  }
}

data "aws_availability_zones" "available" {
  state = var.az_status
}

