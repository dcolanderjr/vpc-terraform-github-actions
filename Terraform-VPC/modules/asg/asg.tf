resource "aws_autoscaling_group" "asg" {
    name                      = var.asg_name
    vpc_zone_identifier       = var.subnet_id
    launch_template {
        id = aws_launch_template.asg_1.id
        version = "$Latest"
    }
    min_size                  = var.asg_min_size
    max_size                  = var.asg_max_size
    desired_capacity          = var.asg_desired_capacity
    health_check_type         = var.asg_health_check_type
    health_check_grace_period = var.asg_health_check_grace_period
    force_delete              = var.asg_force_delete
    termination_policies      = var.asg_termination_policies
    
    #target_group_arns = [data.terraform_remote_state.loadbalancer.outputs.target_group_arn]
}

resource "aws_launch_template" "asg_1" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type
  #user_data     = file("${path.module}/user_data.sh")
  key_name      = var.key_name
  
  tags = var.asg_tags

}


