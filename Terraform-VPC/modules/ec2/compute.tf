resource "aws_instance" "ec2" {
  count                         = var.instance_count
  ami                           = data.aws_ami.ami_provider.id
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  availability_zone             = data.aws_availability_zones.available.names[count.index]
  subnet_id                     = var.subnet_id[count.index]
  associate_public_ip_address   = var.associate_public_ip_address
  vpc_security_group_ids        = [var.security_group_id]
  user_data                     = file("${path.module}/user_data.sh")
  
  tags = {
    Name = var.instance_name
  }
}