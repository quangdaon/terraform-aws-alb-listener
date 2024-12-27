
output "tg_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.target_group.arn
}

output "listener_arn" {
  description = "ARN of the ALB listener"
  value       = aws_lb_listener.https_forward.arn
}
