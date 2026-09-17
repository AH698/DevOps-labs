resource "aws_default_security_group" "default" {
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    cidr_blocks = [var.http_cidr]
    from_port   = var.http_port
    to_port     = var.http_port
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
    from_port   = var.ssh_port
    to_port     = var.ssh_port
  }

  egress {
    protocol    = var.egress_protocol
    from_port   = var.egress_from_port
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
