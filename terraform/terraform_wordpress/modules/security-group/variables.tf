variable "vpc_id" {
  description = "ID of the VPC where the security group will be created "
}

variable "http_port" {
  description = "Port used for http traffic"
  type        = number
  default     = 80
}

variable "ssh_port" {
  description = "Port used for ssh traffic"
  type        = number
  default     = 22
}

variable "http_cidr" {
  description = "cidr block allowed to access the web server over http"
  type        = string
  default     = "0.0.0.0/0"

}

variable "ssh_cidr" {
  description = "cidr block allowed to access the web server over ssh"
  type        = string
  sensitive = true
}

# egress 

variable "egress_protocol" {
  description = "value"
  type        = number
  default     = "-1"
}

variable "egress_from_port" {
  description = "Starting port for outbound traffic"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "Ending port for outbound traffic"
  type        = number
  default     = 0

}