#### VPC Definitions ####
vpc_name          = "Terraform-Demo-VPC"
vpc_id            = "vpc-08d2040100b541d9f"
vpc_cidr          = "10.0.0.0/16"
instance_tenancy  = "default"
vpc_tags = {
  Name      = "TFDemoVPC"
  Terraform = "true"
  Project   = "Terraform VPC"
}

az_state = "available"

#### Subnet Definitions ####
subnets                 = "Terraform-Demo-Subnet"
subnet_cidr             = ["10.0.1.0/24", "10.0.12.0/24"]
availability_zones      = ["us-east-1b", "us-east-1c"]
map_public_ip_on_launch = "true"
subnet_names            = ["TFDemoSubnet1", "TFDemoSubnet2"]

#### Internet Gateway Definitions ####
igw = "Terraform-Demo-IGW"


#### Route Table Definitions ####
route_cidr_block = "0.0.0.0/0"
rt-tags = {
  Name      = "TFDemoRouteTable"
  Terraform = "true"
  Project   = "Terraform VPC"
}

#### Security Group Definitions ####
// Other variables...
security_group_name = "Terraform-Demo-SG"
ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS"
  },
  {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SonarQube"
  },
  {
    from_port   = 8080
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Jenkins"
  },
  {
    from_port   = 3000
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Grafana"
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

security_group_tags = {
  Name          = "TFDemoSecurityGroup"
  Terraform     = "true"
  Project       = "Terraform VPC"
}

#### EC2 Definitions ####
instance_count                = 2
ami_most_recent               = true
ami_owners                    = ["099720109477"]
ami_name_pattern              = "*ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
key_name                      = "DevSecOpsProject"
instance_name                 = "Terraform-Demo-Instance"
associate_public_ip_address   = true
instance_type                 = "t3.micro"
subnet_id                     = [""]

instance_tags = {
  Name      = "TFDemoInstance-${count.index + 1}"
  Terraform = "true"
  Project   = "Terraform VPC"
}
az_status                     = "available"