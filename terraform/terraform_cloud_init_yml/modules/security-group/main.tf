resource "aws_security_group" "web" {

  #http_ingress
  ingress {
    protocol    = var.http_ingress_protocol
    cidr_blocks = [var.http_cidr]
    from_port   = var.http_port
    to_port     = var.http_port
  }

  #ssh_ingress
  ingress {
    protocol    = var.ssh_ingress_protocol
    cidr_blocks = [var.ssh_cidr]
    from_port   = var.ssh_port
    to_port     = var.ssh_port
  }

  egress {
    protocol    = var.egress_protocol
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    cidr_blocks = [var.egress_cidr_blocks]
  }
}