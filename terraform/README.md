# Terraform

Terraform is an Infrastructure as Code (IaC) tool used to create and manage infrastructure through code instead of manually creating resources.

Terraform uses HashiCorp Configuration Language (HCL).

# Infrastructure as Code

Infrastructure as Code means defining infrastructure inside configuration files.

Benefits:

- Repeatable infrastructure
- Less manual configuration
- Can be version controlled with Git
- Easier to automate
- Infrastructure can be recreated consistently

# Providers

Providers allow Terraform to communicate with platforms such as AWS.

```hcl
provider "aws" {
  region = "eu-west-2"
}
```

Terraform uses the AWS provider to communicate with AWS APIs and manage resources.

# Resources

Resources are infrastructure objects Terraform creates and manages.

```hcl
resource "aws_instance" "web" {
  ami           = "AMI_ID"
  instance_type = "t2.micro"
}
```

`aws_instance` = resource type

`web` = Terraform name for the resource

Resources can reference each other:

```hcl
aws_instance.web.id
```

# Variables

Variables make Terraform configurations reusable.

```hcl
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
```

Use the variable:

```hcl
instance_type = var.instance_type
```

# Outputs

Outputs display useful information after Terraform creates infrastructure.

```hcl
output "public_ip" {
  value = aws_instance.web.public_ip
}
```

View outputs with:

```bash
terraform output
```

# Terraform State

Terraform tracks the infrastructure it manages using a state file:

```text
terraform.tfstate
```

State allows Terraform to compare the configuration with the infrastructure it manages and work out what needs to change.

State files should not be committed to a public GitHub repository because they can contain sensitive information.

# Main Terraform Commands

Initialise the project and download required providers:

```bash
terraform init
```

Format Terraform files:

```bash
terraform fmt
```

Check the configuration is valid:

```bash
terraform validate
```

Preview changes:

```bash
terraform plan
```

Create or update infrastructure:

```bash
terraform apply
```

Destroy managed infrastructure:

```bash
terraform destroy
```

# Terraform Workflow

The basic workflow is:

```text
Write configuration
        ↓
terraform init
        ↓
terraform fmt
        ↓
terraform validate
        ↓
terraform plan
        ↓
terraform apply
```

When the infrastructure is no longer needed:

```bash
terraform destroy
```

# AWS EC2

Terraform can create an EC2 instance using:

```hcl
resource "aws_instance" "web" {
  ami           = "AMI_ID"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-web"
  }
}
```

The AMI defines the machine image/operating system.

The instance type defines the compute resources used by the instance.

# Security Groups

Security Groups control inbound and outbound traffic to AWS resources.

For a basic web server:

```text
22 = SSH
80 = HTTP
443 = HTTPS
```

HTTP port 80 can be opened so users can access the website.

SSH should normally only be allowed from trusted IP addresses.

# User Data

User data allows an EC2 instance to automatically run configuration when it first launches.

Example for Amazon Linux and Apache:

```bash
#!/bin/bash
dnf install -y httpd
systemctl enable --now httpd
```

This automatically:

1. Installs Apache
2. Enables Apache at boot
3. Starts Apache

On Amazon Linux the Apache package and service are called:

```text
httpd
```

# Cloud-Init

Cloud-init processes instance startup configuration.

A cloud-config file starts with:

```yaml
#cloud-config
```

Example:

```yaml
#cloud-config

packages:
  - httpd

runcmd:
  - systemctl enable --now httpd
```

Terraform can load a separate cloud-init file:

```hcl
user_data = file("${path.module}/cloud-init.yaml")
```

This keeps the EC2 configuration separate from the Terraform infrastructure code.

# Terraform Project Structure

A simple structure:

```text
terraform-project/
├── main.tf
├── variables.tf
├── outputs.tf
├── cloud-init.yaml
├── .gitignore
└── README.md
```

# .gitignore

Files such as Terraform state and local Terraform data should not be committed.

```gitignore
.terraform/
*.tfstate
*.tfstate.*
*.tfvars
*.tfplan
```

`.terraform.lock.hcl` should normally be committed because it records the selected provider versions.

# Key Learning

Terraform allows me to define AWS infrastructure as code instead of manually creating everything through the AWS Console.

My basic deployment flow is:

```text
Terraform
   ↓
AWS Provider
   ↓
EC2 + Security Group
   ↓
User Data / Cloud-Init
   ↓
Install Apache
   ↓
Start httpd
   ↓
Website available through EC2
```

The main commands to remember are:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```