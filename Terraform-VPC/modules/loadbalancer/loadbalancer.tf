resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  
  default_action {
      type             = var.default_action_type
      target_group_arn = var.default_action_target_group_arn
  }

  lifecycle {
    ignore_changes = [
      default_action[0].target_group_arn,
    ]
  }
}


resource "aws_lb_target_group" "tg" {
  name        = var.alb_tg_name
  port        = var.alb_tg_port
  protocol    = var.alb_tg_protocol
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  count            = length(var.instances)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instances[count.index]
  port             = var.alb_tg_port
}

resource "aws_lb" "alb" {
  name                        = var.alb_name
  internal                    = var.internal
  load_balancer_type          = var.load_balancer_type
  security_groups             = [var.security_group_id]
  subnets                     = var.subnets_for_alb
  enable_deletion_protection  = var.enable_deletion_protection
  tags                        = var.alb_tags
}
