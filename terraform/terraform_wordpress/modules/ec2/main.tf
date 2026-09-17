resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = var.public_ip
  key_name                    = var.key_name
  user_data                   = var.user_data
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}

