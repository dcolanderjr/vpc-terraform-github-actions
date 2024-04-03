#### VPC Definitions ####
vpc_name         = "Terraform-Demo-VPC"
vpc_id           = "vpc-013c2d05efc88f9cb"
vpc_cidr         = "10.0.0.0/16"
instance_tenancy = "default"
vpc_tags = {
  Name      = "TFDemoVPC"
  Terraform = "true"
  Project   = "Terraform VPC"
}

az_state = "available"

#### Subnet Definitions ####
subnets                 = [""]
subnet_cidr             = ["10.0.1.0/24", "10.0.12.0/24"]
availability_zones      = ["us-east-1", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
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
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Jenkins"
  },
  {
    from_port   = 3000
    to_port     = 3000
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
    description = "All"
  }
]

security_group_tags = {
  Name      = "TFDemoSecurityGroup"
  Terraform = "true"
  Project   = "Terraform VPC"
}

#### EC2 Definitions ####
instance_count              = 2
ami_most_recent             = true
ami_owners                  = ["099720109477"]
ami_name_pattern            = "*ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
key_name                    = "Deric_Key_Pair"
instance_name               = "Terraform-Demo-Instance"
associate_public_ip_address = true
instance_type               = "t3.micro"
subnet_id                   = ["", ""]
security_group_id           = ""

instance_tags = {
  Name      = "TFDemoInstances"
  Terraform = "true"
  Project   = "Terraform VPC"
}

az_status = "available"

#### Load Balancer Definitions ####

alb_name                   = "Terraform-Demo-ALB"
internal                   = false
load_balancer_type         = "application"
subnets_for_alb            = ["", ""]
enable_deletion_protection = false
alb_tags = {
  Name      = "TFDemoALB"
  Terraform = "true"
  Project   = "Terraform VPC"
}

#### Listener Definitions ####

listener_port       = 80
listener_protocol   = "HTTP"
default_action_type = "forward"

#### Target Group Definitions ####

alb_tg_name                     = "Terraform-Demo-TG"
alb_tg_port                     = "80"
alb_tg_protocol                 = "HTTP"
default_action_target_group_arn = ""


#### Target Group Attachment Definitions ####
condition = true
instances = ["i-06d36e3333f166375", "i-0883da27498edde77", "i-0e14c8d51837e18e0", "i-070a7aaf8119a8842"]

#### Auto Scaling Group Definitions ####

asg_name                      = "Terraform-Demo-ASG"
asg_max_size                  = 5
asg_min_size                  = 2
asg_desired_capacity          = 3
asg_health_check_type         = "EC2"
asg_health_check_grace_period = 300
asg_force_delete              = true
asg_termination_policies      = ["OldestInstance", "NewestInstance"]
target_group_arns             = [""]
name_prefix                   = "Terraform-Demo-LaunchTemplate"
image_id                      = "ami-080e1f13689e07408"
asg_instance_type             = "t3.micro"

asg_tags                      = {
  Name      = "TFDemoASG"
  Terraform = "true"
  Project   = "Terraform VPC"
}

backend                       = "s3"

config                       = {
  bucket = "tfstate-devops-project-2024"
  key    = "DevOps/terraform.tfstate"
  region = "us-east-1"
}


