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

variable "http_mode" {
  type    = string
  default = "forward"
  validation {
    condition     = contains(["allow", "forward", "reject"], var.http_mode)
    error_message = "http_mode must be on of: allow, forward, reject"
  }
}

variable "health_check_path" {
  type        = string
  description = "Path to check for health"
  default     = "/"
}
