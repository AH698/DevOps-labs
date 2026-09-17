variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "igw_name" {
  description = "The name of the igw"
  type        = string
  default     = "WordPress-igw"

}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "route_cidr" {
  description = "value"
  type        = string
  default     = "0.0.0.0/0"

}