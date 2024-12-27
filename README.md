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
  http_mode         = "reject"  # Optional / defaults to "forward" (See below)
}
```

### http_mode

The `http_mode` variable determines how to resolve HTTP (non-HTTPS) requests. It accepts one of three options:

- **forward** (default) - Forward to HTTPS
- **reject** - Throw a 403, rejecting all non-HTTPS requests
- **allow** (insecure) - Forwards the request to the target group