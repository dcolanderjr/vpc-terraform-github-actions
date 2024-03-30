output "vpc_id" {
  value = aws_vpc.vpc_name.id
}

output "subnet_ids" {
  value = aws_subnet.subnets.*.id
}