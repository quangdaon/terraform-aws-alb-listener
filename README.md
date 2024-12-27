# Terraform AWS ALB Listener Module

This module is designed to be compatible with my "[quinfrastructure](https://github.com/quangdaon/quinfrastructure)".

## Usage

```hcl
module "my_app_alb" {
  source  = "app.terraform.io/Quangdao/alb-listener/aws"
  version = "0.0.6"

  quinfrastructure  = data.tfe_outputs.core.values
  name              = "my-app"
  hostname          = "myapp.example.com"
  health_check_path = "/health" # Optional / defaults to "/"
  http_mode         = "reject"  # Optional / defaults to "forward"
}
```
