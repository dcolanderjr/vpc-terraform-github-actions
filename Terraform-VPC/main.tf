# Virtual Private Cloud
module "vpc" {
  source                  = "./modules/vpc/"
  vpc_id                  = var.vpc_id
  vpc_cidr                = var.vpc_cidr
  instance_tenancy        = var.instance_tenancy
  vpc_tags                = var.vpc_tags
  subnet_cidr             = var.subnet_cidr
  availability_zones      = var.availability_zones
  map_public_ip_on_launch = var.map_public_ip_on_launch
  subnet_names            = var.subnet_names
  igw                     = var.igw
  route_cidr_block        = var.route_cidr_block
  vpc_name                = var.vpc_name
  subnets                 = var.subnets
  rt-tags                 = var.rt-tags
  az_state                = var.az_state
}

# Security Group
module "security_group" {
  source                  = "./modules/security_group/"
  security_group_name     = var.security_group_name
  vpc_id                  = module.vpc.vpc_id
  ingress_rules           = var.ingress_rules
  egress_rules            = var.egress_rules
  security_group_tags     = var.security_group_tags
}  

# EC2 Compute
module "ec2" {
  source                        = "./modules/ec2/"
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  subnet_id                     = module.vpc.subnet_ids
  sg_id                         = module.security_group.sg_id
  instance_tags                 = var.instance_tags
  ami_most_recent               = var.ami_most_recent
  az_status                     = var.az_status
  ami_owners                    = var.ami_owners
  ami_name_pattern              = var.ami_name_pattern
  associate_public_ip_address   = var.associate_public_ip_address
  instance_name                 = var.instance_name
  instance_count                = var.instance_count
}