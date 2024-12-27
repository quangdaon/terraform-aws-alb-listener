variable "quinfrastructure" {
  type = object({
    vpc_id                 = string
    alb_arn                = string
    alb_http_listener_arn  = string
    alb_https_listener_arn = string
  })
}

variable "name" {
  type        = string
  description = "Name of the target group"
}

variable "hostname" {
  type        = string
  description = "Domain to target"
}

variable "health_check_path" {
  type        = string
  description = "Path to check for health"
  default     = "/"
}
