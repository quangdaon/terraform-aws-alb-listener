resource "aws_lb_target_group" "target_group" {
  name        = var.name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.quinfrastructure.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "90"
    protocol            = "HTTP"
    matcher             = "200-299"
    timeout             = "20"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

resource "aws_lb_listener_rule" "http_rule" {
  listener_arn = var.quinfrastructure.alb_http_listener_arn

  condition {
    host_header {
      values = [var.hostname]
    }
  }

  action {
    type = "redirect"
    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_302"
    }
  }
}

resource "aws_lb_listener_rule" "https_rule" {
  listener_arn = var.quinfrastructure.alb_https_listener_arn

  condition {
    host_header {
      values = [var.hostname]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}
