output "instances" {
  value = aws_instance.ec2.*.id
}