module "ec2" {
  source        = "../terraform_cloud_init_yml/modules/ec2"
  instance_name = "yml_tester"
  instance_type = "t3.micro"
  ami           = "ami-0bf5d5d5c92a17e24"
  key_name = var.key_name
  user_data = file("${path.module}/cloud-init.yml")
  public_ip = true
  security_group_id = module.security-group.security_group_id
}

module "security-group" {
    source = "./modules/security-group"
    ssh_cidr = var.ssh_cidr
}