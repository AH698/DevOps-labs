module "ec2" {
  source        = "./modules/ec2"
  instance_name = "WordPress"
  ami           = "ami-0bf5d5d5c92a17e24"
  key_name      = var.key_name
  user_data = templatefile("${path.module}/cloud-init.sh", {
    db_name     = "WordPress"
    db_user     = "Wordpress_User"
    db_password = var.db_password
  })
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security-group.security_group_id
}

module "security-group" {
  source   = "./modules/security-group"
  ssh_cidr = var.ssh_cidr
  vpc_id   = module.vpc.vpc_id

}

module "vpc" {
  source = "./modules/vpc"
}