resource "aws_instance" "ec2" {
  count                         = length(var.instance_count)
  ami                           = data.aws_ami.ami_provider.id
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  availability_zone             = data.aws_availability_zones.available.names[count.index]
  subnet_id                     = random_element(data.aws_subnet_ids.all.ids)
  associate_public_ip_address   = var.associate_public_ip_address
  vpc_security_group_ids        = [aws_security_group.sg.id]
  user_data                     = file("${path.module}/user_data.sh")
  tags = var.instance_tags
}