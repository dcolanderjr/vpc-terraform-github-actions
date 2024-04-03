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

# Auto Scaling Group
module "asg" {
  source                          = "./modules/asg/"
  asg_name                        = var.asg_name
  asg_termination_policies        = var.asg_termination_policies
  image_id                        = var.image_id
  asg_health_check_type           = var.asg_health_check_type
  name_prefix                     = var.name_prefix
  asg_min_size                    = var.asg_min_size
  asg_health_check_grace_period   = var.asg_health_check_grace_period
  asg_desired_capacity            = var.asg_desired_capacity
  asg_max_size                    = var.asg_max_size
  subnet_id                       = module.vpc.subnet_ids
  instance_type                   = var.instance_type
  asg_force_delete                = var.asg_force_delete
  target_group_arns               = [module.loadbalancer.target_group_arn]
  backend                         = var.backend
  config                          = var.config
  asg_tags                        = var.asg_tags
  key_name                        = var.key_name

  depends_on = [module.vpc, module.ec2, module.loadbalancer]
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

module "ecr" {
  source                                        = "./modules/ecr/"
  repository_name                               = var.repository_name
  image_tag_mutability                          = var.image_tag_mutability
  scan_on_push                                  = var.scan_on_push
  encryption_type                               = var.encryption_type
  lifecycle_policy_file                         = var.lifecycle_policy_file
  scan_type                                     = var.scan_type
  scan_frequency                                = var.scan_frequency
  repository_filter                             = var.repository_filter
  filter_type                                   = var.filter_type
  ecr_actions_org_can_pull                      = var.ecr_actions_org_can_pull
  ecr_actions_github_actions_can_push           = var.ecr_actions_github_actions_can_push
  principal_type_org_can_pull                   = var.principal_type_org_can_pull
  principal_identifiers_org_can_pull            = var.principal_identifiers_org_can_pull
  principal_type_github_actions_can_push        = var.principal_type_github_actions_can_push
  principal_identifiers_github_actions_can_push = var.principal_identifiers_github_actions_can_push
  condition_test                                = var.condition_test
  condition_variable                            = var.condition_variable
  condition_values                              = var.condition_values
  iam_role                                      = var.iam_role
  sid_org_can_pull                              = var.sid_org_can_pull
  sid_github_actions_can_push                   = var.sid_github_actions_can_push
  effect_github_actions_can_push                = var.effect_github_actions_can_push
  effect_org_can_pull                           = var.effect_org_can_pull
  github_assume_role_policy                     = var.github_assume_role_policy
  github_iam_role                               = var.github_iam_role
  backend_assume_role_policy                    = var.backend_assume_role_policy
  backend_iam_role                              = var.backend_iam_role
  create_ecr_repository                         = var.create_ecr_repository

data "terraform_remote_state" "lb" {
  backend = "s3"
  config = var.config

  outputs = {
    target_group_arn = "target_group_arn"
  }
}
