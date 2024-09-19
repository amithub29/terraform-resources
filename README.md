# Terraform Commands

- `terraform init`: Initializes a new or existing Terraform configuration by downloading the necessary provider plugins.
- `terraform validate`: Validates the Terraform configuration files for syntax errors.
- `terraform plan`: Creates an execution plan, showing what actions will be taken without actually performing the changes.
- `terraform apply`: Applies the changes required to reach the desired state of the configuration.
- `terraform destroy`: Destroys the Terraform-managed infrastructure.
- `terraform console`: Provides interactive command line utility to test functions.
- `terraform refresh`: Fetches the current state of infrastructure and update the state file.
- `terraform fmt`: Formats the Terraform code as per the standards.
- `terraform plan -out release.plan`: Saves the deployment plan to a file.
- `terraform apply -auto-approve`: Applies the changes without asking for confirmation.
- `terraform apply -replace aws_instance.myec2`: Replace specific resource.
- `terraform destroy -target aws_instance.myec2`: Destroys specific resource.

## Terraform State Commands

- `terraform state list`: Lists all resources managed by Terraform.
- `terraform state show aws_instance.myec2`: Shows the attributes of a resource in the state.
- `terraform state pull`: Pulls the state file from a remote backend.
- `terraform state rm aws_instance.myec2`: Removes resource from state without destroying it.
- `terraform state mv aws_instance.myec2 aws_instance.ec2-dev`: Renames the logical name of the resource in state file.  