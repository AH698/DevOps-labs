# EC2 deployment with cloud-init

This project demonstrates how to deploy an EC2 instance with Terraform and configure it entirely through a cloud-init YAML file. Apache is installed, a static page is written and the service is started at first boot, so the web server is live without anyone logging into the instance.

## Terraform code structure
terraform_cloud_init_yml/
├── main.tf                     # Calls both modules and passes values between them
├── variables.tf                # Root input variables
├── providers.tf                # AWS provider and region
├── cloud-init.yml              # Cloud-config file run at first boot
├── terraform.tfvars            # Real variable values (not committed)
├── terraform.tfstate           # Terraform state (not committed)
├── .terraform.lock.hcl         # Pins the AWS provider version
├── .gitignore                  # Excludes state, tfvars and key files
├── screenshot/                 # Proof of the running page
└── modules/
    ├── security-group/
    │   ├── main.tf             # Ingress and egress rules
    │   ├── variables.tf
    │   └── outputs.tf          # Security group ID
    └── ec2/
        ├── main.tf             # EC2 instance definition
        ├── variables.tf
        └── outputs.tf          # Public IP of the instance