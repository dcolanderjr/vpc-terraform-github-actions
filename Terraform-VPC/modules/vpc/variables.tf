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
  type        = string
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
