# Terraform

Terraform is an Infrastructure as Code (IaC) tool created by HashiCorp. It allows infrastructure to be defined and managed through configuration files instead of manually configuring resources.

Terraform uses HashiCorp Configuration Language (HCL).

# Infrastructure as Code

Infrastructure as Code means managing infrastructure through code.

Benefits include:

- Repeatable deployments
- Consistent infrastructure
- Version control
- Automation
- Reusable configurations
- Easier infrastructure management

# Terraform Configuration

Terraform files use the `.tf` extension.

Example:

```hcl
resource "example_resource" "main" {
  name = "example"
}
```

Terraform reads all `.tf` files in the same directory together as one configuration.

# Terraform Block

The `terraform` block configures Terraform itself.

```hcl
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
```

It can define:

- Required Terraform version
- Required providers
- Provider versions
- Backend configuration

# Providers

Providers allow Terraform to communicate with external platforms and APIs.

Examples include:

```text
AWS
Azure
Google Cloud
Kubernetes
GitHub
```

Providers are declared inside `required_providers` and can then be configured with a `provider` block.

# Resources

Resources are infrastructure objects managed by Terraform.

Syntax:

```hcl
resource "resource_type" "resource_name" {
  argument = "value"
}
```

A resource can be referenced elsewhere using:

```hcl
resource_type.resource_name
```

A specific attribute can be accessed using:

```hcl
resource_type.resource_name.id
```

# Variables

Variables allow values to be passed into Terraform configurations instead of hard-coding them.

```hcl
variable "environment" {
  type    = string
  default = "dev"
}
```

Reference a variable:

```hcl
var.environment
```

Common variable types include:

```text
string
number
bool
list
set
map
object
```

Variables can have:

```text
type
default
description
validation
sensitive
nullable
```

# Variable Values

Variable values can come from several places, including:

```text
Default values
terraform.tfvars
*.auto.tfvars
-var
-var-file
Environment variables
```

Example:

```hcl
environment = "dev"
```

# Outputs

Outputs expose values from a Terraform configuration.

```hcl
output "example" {
  value = resource_type.resource_name.id
}
```

Outputs are also important when passing information from a child module back to its parent module.

# Local Values

Local values allow expressions or values to be given a reusable name inside a module.

```hcl
locals {
  environment = "development"
}
```

Reference them using:

```hcl
local.environment
```

Unlike input variables, locals are defined internally rather than being supplied as module inputs.

# Data Sources

Data sources allow Terraform to read information without managing the object as a resource.

Syntax:

```hcl
data "data_source_type" "example" {
}
```

Reference it using:

```hcl
data.data_source_type.example.id
```

Difference:

```text
resource = Terraform manages an object
data     = Terraform reads information
```

# Modules

A module is a collection of Terraform configuration files in a directory.

Every Terraform configuration has a **root module**.

The root module can call **child modules**.

Example:

```hcl
module "network" {
  source = "./modules/network"
}
```

`source` tells Terraform where the module comes from.

Modules can come from:

```text
Local directories
Terraform Registry
Git repositories
Other supported remote sources
```

Modules help:

- Reuse code
- Reduce duplication
- Organise infrastructure
- Standardise configurations

# Module Inputs and Outputs

Variables are commonly used to pass values into a module.

```hcl
module "example" {
  source = "./modules/example"

  environment = var.environment
}
```

Inside the module:

```hcl
variable "environment" {
  type = string
}
```

Outputs expose values from the module:

```hcl
output "resource_id" {
  value = resource_type.example.id
}
```

The parent module can reference it using:

```hcl
module.example.resource_id
```

# Terraform Project Structure

A common project using local modules could look like:

```text
terraform-project/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules/
│   ├── module-one/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── module-two/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── .gitignore
└── README.md
```

There is no requirement for Terraform configurations to use these exact filenames. Terraform loads the `.tf` files in the module directory together.

# Resource References

Terraform allows values from one resource to be used by another.

```hcl
resource_type.resource_name.attribute
```

This also allows Terraform to detect dependencies automatically.

# Dependencies

Terraform builds a dependency graph to determine the order resources need to be handled.

When one resource references another, Terraform normally creates an **implicit dependency** automatically.

Explicit dependencies can be created using:

```hcl
depends_on = [
  resource_type.resource_name
]
```

`depends_on` is mainly used when a dependency exists but cannot be detected through normal references.

# Terraform State

Terraform uses state to keep track of managed infrastructure.

With local state, the main state file is:

```text
terraform.tfstate
```

Terraform uses state to map configuration to real infrastructure and determine what needs to be created, updated or destroyed.

State should be protected because it can contain sensitive information.

# Terraform Lock File

Terraform creates:

```text
.terraform.lock.hcl
```

This records provider dependency selections and checksums.

It should normally be committed to version control.

# Terraform Registry

The Terraform Registry provides:

- Providers
- Modules
- Provider documentation

Provider documentation shows available:

```text
Resources
Data sources
Arguments
Attributes
Examples
```

# Terraform Commands

Initialise a Terraform working directory:

```bash
terraform init
```

Format configuration:

```bash
terraform fmt
```

Validate configuration:

```bash
terraform validate
```

Preview proposed changes:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

Destroy managed infrastructure:

```bash
terraform destroy
```

Display outputs:

```bash
terraform output
```

List resources in state:

```bash
terraform state list
```

Display current state or a saved plan:

```bash
terraform show
```

Display Terraform version:

```bash
terraform version
```

# Terraform Workflow

```text
Write configuration
        |
        v
terraform init
        |
        v
terraform fmt
        |
        v
terraform validate
        |
        v
terraform plan
        |
        v
terraform apply
```

When infrastructure is no longer required:

```bash
terraform destroy
```

# Terraform Plan Symbols

Common symbols shown by `terraform plan` include:

```text
+   create
~   update in-place
-   destroy
-/+ destroy and create replacement
```

The plan should be reviewed before applying changes.

# Core Terraform Structure

```text
Terraform
│
├── Providers
├── Resources
├── Data Sources
├── Variables
├── Local Values
├── Outputs
├── Modules
├── Dependencies
└── State
```

Core commands:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```