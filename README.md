# Terraform AWS ALB Listener Module

This module is designed to be compatible with my "[quinfrastructure](https://github.com/quangdaon/quinfrastructure)".

## Usage

```hcl
module "mtg_bans_alb" {
  source  = "app.terraform.io/Quangdao/alb-listener/aws"
  version = "0.0.2"

  quinfrastructure  = data.tfe_outputs.core.values
  name              = "my-app"
  health_check_path = "/health" # Optional / defaults to "/"
}
```
