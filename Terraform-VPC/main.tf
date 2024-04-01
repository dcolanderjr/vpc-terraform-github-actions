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
  source              = "./modules/security_group/"
  security_group_name = var.security_group_name
  vpc_id              = var.vpc_id
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
  security_group_tags = var.security_group_tags

  depends_on = [module.vpc]
}

# EC2 Compute
module "ec2" {
  source                      = "./modules/ec2/"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = module.vpc.subnet_ids
  security_group_id           = module.security_group.aws_security_group_id
  instance_tags               = var.instance_tags
  ami_most_recent             = var.ami_most_recent
  az_status                   = var.az_status
  ami_owners                  = var.ami_owners
  ami_name_pattern            = var.ami_name_pattern
  associate_public_ip_address = var.associate_public_ip_address
  instance_name               = var.instance_name
  instance_count              = var.instance_count

  depends_on = [module.vpc, module.security_group]
}

# Application Load Balancer
module "loadbalancer" {
  source                          = "./modules/loadbalancer/"
  alb_name                        = var.alb_name
  subnets_for_alb                 = module.vpc.subnet_ids
  enable_deletion_protection      = var.enable_deletion_protection
  load_balancer_type              = var.load_balancer_type
  internal                        = var.internal
  alb_tags                        = var.alb_tags
  default_action_type             = var.default_action_type
  default_action_target_group_arn = module.loadbalancer.target_group_arn
  alb_tg_protocol                 = var.alb_tg_protocol
  alb_tg_name                     = var.alb_tg_name
  vpc_id                          = var.vpc_id
  listener_port                   = var.listener_port
  alb_tg_port                     = var.alb_tg_port
  listener_protocol               = var.listener_protocol
  instances                       = var.instances
  instance_tags                   = var.instance_tags
  condition                       = var.condition
  security_group_id               = module.security_group.aws_security_group_id

  depends_on = [module.vpc, module.security_group, module.ec2]
}