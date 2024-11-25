variable "quinfrastructure" {
  type = object({
    vpc_id  = string
    alb_arn = string
  })
}

variable "name" {
  type = string
  description = "Name of the target group"
}

variable "health_check_path" {
  type        = string
  description = "Path to check for health"
}
