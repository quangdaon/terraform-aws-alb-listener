resource "aws_lb_target_group" "target_group" {
  name        = var.name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.network_config.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "90"
    protocol            = "HTTP"
    matcher             = "200-299"
    timeout             = "20"
    path                = "/"
    unhealthy_threshold = "2"
  }
}


resource "aws_lb_listener" "https_forward" {
  load_balancer_arn = var.network_config.alb_arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
