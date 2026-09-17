variable "ami" {
  description = "AMI id for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "public_ip" {
  description = "The public ip, that the instance uses"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "value"
  type        = string
}

variable "user_data" {
  description = "value"
  type        = string
}

variable "instance_name" {
  description = "The name of the instance"
  type        = string

}

variable "security_group_id" {
  description = "Security group ID attached to the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet for the EC2 instance"
  type        = string
}



