# WordPress deployment through AWS EC2 

This project demonstrates how to deploy a WordPress site on an AWS EC2 instance using Terraform. Apache, PHP, MariaDB and WordPress are installed automatically at boot through a user-data script, so the site is ready without any manual setup after terraform apply.

## Terraform code structure

```
terraform_wordpress/
├── main.tf                     # Calls the three modules and passes values between them
├── variables.tf                # Root input variables
├── providers.tf                # AWS provider and region
├── cloud-init.sh               # User-data script run at first boot
├── terraform.tfvars            # Real variable values (not committed)
├── terraform.tfstate           # Terraform state (not committed)
├── .terraform.lock.hcl         # Pins the AWS provider version
├── .gitignore                  # Excludes state, tfvars and key files
├── screenshots/                # Proof of the running site
└── modules/
    ├── vpc/
    │   ├── main.tf             # VPC, subnet, internet gateway, route table
    │   ├── variables.tf
    │   └── outputs.tf          # VPC and subnet IDs
    ├── security-group/
    │   ├── main.tf             # Ingress and egress rules
    │   ├── variables.tf
    │   └── outputs.tf          # Security group ID
    └── ec2/
        ├── main.tf             # EC2 instance definition
        ├── variables.tf
        └── outputs.tf          # Instance details
```