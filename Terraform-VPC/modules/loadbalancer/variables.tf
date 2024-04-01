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

variable "vpc_id" {
    description = "The ID of the VPC"
    type        = string
}

variable "instances" {
    description = "A list of instance IDs to attach to the target group"
    type        = list(string)
}

variable "instance_tags" {
  description = "Tags used to filter instances"
  type        = map(string)
}

variable "default_action_target_group_arn" {
  description = "The ARN of the target group for the default action"
  type        = string
}

variable "condition" {
  description = "Condition to attach instances to the target group"
  type        = bool
}

variable "security_group_id" {
  description = "The ID of the security group"
  type        = string
}