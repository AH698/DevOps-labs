variable "key_name" {
  description = "Name of an existing key pair .pem used for access to ssh into the instance"
  type        = string
}

variable "ssh_cidr" {
  description = "cidr block allowed to access the web server over ssh"
  type        = string
  sensitive   = true
}