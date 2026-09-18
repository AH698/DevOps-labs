#ingress_http

variable "http_ingress_protocol" {
  description = "Network protocol the ingress rules apply"
  type        = string
  default     = "tcp"
}

variable "http_cidr" {
  description = "cidr block allowed to access the web server over http"
  type        = string
  default     = "0.0.0.0/0"
}

variable "http_port" {
  description = "value"
  type        = number
  default     = 80
}

# ingress_ssh

variable "ssh_ingress_protocol" {
  description = "value"
  type        = string
  default     = "tcp"
}

variable "ssh_cidr" {
  description = "cidr block allowed to access the web server over ssh"
  type        = string
  sensitive   = true
}

variable "ssh_port" {
  description = "Port used for ssh traffic"
  type        = number
  default     = 22
}

#egress 

variable "egress_protocol" {
  description = "value"
  type        = string
  default     = "-1"
}

variable "egress_from_port" {
  description = "starting port for outbound traffic"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "finishing port for outbound traffic"
  type        = number
  default     = 0
}

variable "egress_cidr_blocks" {
  description = "cidr range allowed for outbound traffic"
  type        = string
  default     = "0.0.0.0/0"
}