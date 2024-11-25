variable "quinfrastructure" {
  type = object({
    vpc_id  = string
    alb_arn = string
  })
}

variable "name" {
  type = string
}
