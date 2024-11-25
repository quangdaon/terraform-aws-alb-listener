
output "tg_arn" {
  description = "ARN of the ALB target group"
  value       = aws_lb_target_group.target_group.arn
}
