# Terraform Commands

- `terraform init`: Initializes a new or existing Terraform configuration by downloading the necessary provider plugins.
- `terraform validate`: Validates the Terraform configuration files for syntax errors.
- `terraform plan`: Creates an execution plan, showing what actions will be taken without actually performing the changes.
- `terraform apply`: Applies the changes required to reach the desired state of the configuration.
- `terraform apply -auto-approve`: Applies the changes without asking for confirmation.
- `terraform destroy`: Destroys the Terraform-managed infrastructure.
- `terraform destroy -target aws_instance.myec2`: Destroy specific resource.

