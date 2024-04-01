variable "asg_name" {
  description = "The name of the Auto Scaling Group"
  type        = string
}

variable "subnet_id" {
  description = "The IDs of the subnets to launch the instances in"
  type        = list(string)
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

variable "instance_type" {
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

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "asg_tags" {
  description = "The tags for the Auto Scaling Group"
  type        = map(string)
}