# VPC Variables

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "instance_tenancy" {
  description = "The tenancy of the instance"
  type        = string
}

variable "vpc_tags" {
  description = "The tags for the VPC"
  type        = map(string)
}

variable "subnets" {
  description = "The name of the subnet"
  type        = list(string)
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = list(string)
}

variable "availability_zones" {
  description = "The availability zones for the subnets"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Map public IP on launch"
  type        = bool
}

variable "subnet_names" {
  description = "The name of the subnet"
  type        = list(string)
}

variable "igw" {
  description = "The name of the internet gateway"
  type        = string
}

variable "route_cidr_block" {
  description = "The CIDR block for the route"
  type        = string
}

variable "rt-tags" {
  description = "The tags for the route table"
  type        = map(string)
}

variable "az_state" {
  description = "State of the availability zones to filter"
  type        = string
}

#### Security Group Variables ####

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "egress_rules" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "security_group_tags" {
  description = "The tags for the security group"
  type        = map(string)
}

#### EC2 Variables ####

variable "ami_most_recent" {
  description = "Whether to fetch the most recent AMI"
  type        = bool
}

variable "ami_owners" {
  description = "List of AMI owners"
  type        = list(string)
}

variable "ami_name_pattern" {
  description = "Pattern to filter AMIs by name"
  type        = string
}


variable "az_status" {
  description = "State of the availability zones to filter"
  type        = string
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = list(string)
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
}

variable "instance_tags" {
  description = "The tags for the instance"
  type        = map(string)
}

variable "security_group_id" {
  description = "The ID of the security group to assign to the instance"
  type        = string
}

variable "instance_count" {
  description = "The number of instances to launch"
  type        = number
}


#### Load Balancer Variables ####

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
}

variable "internal" {
  description = "If true, the LB will be internal"
  type        = bool
}

variable "load_balancer_type" {
  description = "The type of load balancer to create"
  type        = string
}

variable "subnets_for_alb" {
  description = "A list of subnets to attach to the LB"
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the LB will be disabled"
  type        = bool
}

variable "alb_tags" {
  description = "A map of tags to assign to the LB"
  type        = map(string)
}

variable "listener_port" {
  description = "The port on which the listener will listen"
  type        = string
}

variable "listener_protocol" {
  description = "The protocol for the listener"
  type        = string
}

variable "default_action_type" {
  description = "The type of action for the default rule"
  type        = string
}

variable "alb_tg_name" {
  description = "The name of the target group"
  type        = string
}

variable "alb_tg_port" {
  description = "The port on which the target group will listen"
  type        = string
}

variable "alb_tg_protocol" {
  description = "The protocol for the target group"
  type        = string
}

variable "instances" {
  description = "A list of instance IDs to attach to the target group"
  type        = list(string)
}

variable "default_action_target_group_arn" {
  description = "The ARN of the target group for the default action"
  type        = string
}

variable "condition" {
  description = "Condition to attach instances to the target group"
  type        = bool
}

#### Auto Scaling Variables ####

variable "asg_name" {
  description = "The name of the Auto Scaling Group"
  type        = string
}

variable "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group"
  type        = number
}

variable "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "The desired capacity of the Auto Scaling Group"
  type        = number
}

variable "asg_health_check_type" {
  description = "The type of health check to perform"
  type        = string
}

variable "asg_health_check_grace_period" {
  description = "The length of time that Auto Scaling waits before checking an instance's health status"
  type        = number
}

variable "asg_force_delete" {
  description = "Allows deleting the Auto Scaling Group without waiting for all instances to be terminated"
  type        = bool
}

variable "asg_termination_policies" {
  description = "The termination policies for the Auto Scaling Group"
  type        = list(string)
}

variable "target_group_arns" {
  description = "The ARNs of the target groups to associate with the Auto Scaling Group"
  type        = list(string)
}

variable "name_prefix" {
  description = "The prefix to apply to the name of the launch template"
  type        = string
}

variable "image_id" {
  description = "The ID of the AMI to use for the launch template"
  type        = string
}

variable "asg_instance_type" {
  description = "The type of instance to launch"
  type        = string
}

variable "backend" {
  description = "The backend to use for the launch template"
  type        = string
}

variable "config" {
  description = "The configuration to use for the launch template"
  type        = map(string)
}

variable "asg_tags" {
  description = "The tags for the Auto Scaling Group"
  type        = map(string)
}

