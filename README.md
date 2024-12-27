# Terraform AWS ALB Listener Module

This module is designed to be compatible with my "[quinfrastructure](https://github.com/quangdaon/quinfrastructure)".

## Usage

```hcl
module "my_app_alb" {
  source  = "app.terraform.io/Quangdao/alb-listener/aws"
  version = "0.0.4"

  quinfrastructure  = data.tfe_outputs.core.values
  name              = "my-app"
  health_check_path = "/health" # Optional / defaults to "/"
}
```
