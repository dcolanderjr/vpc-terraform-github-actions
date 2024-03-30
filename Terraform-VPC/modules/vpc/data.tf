# Gives you values of the availability zones in the region you are working in.

data "aws_availability_zones" "available" {
  state = var.az_state
}
