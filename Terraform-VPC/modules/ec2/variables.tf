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

variable "instance_name" {
  description = "The name of the instance"
  type        = string
}

variable "instance_count" {
  description = "The number of instances to launch"
  type        = number
}
