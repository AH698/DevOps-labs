variable "db_password" {
  description = "WordPress database password"
  type        = string
  sensitive   = true
}

# for ec2 
variable "key_name" {
  type      = string
  sensitive = true
}

#for security-group
variable "ssh_cidr" {
  description = "cidr block allowed to access the web server over ssh"
  type        = string
  sensitive   = true
}