variable "ami" {
  description = "Amazon machine image id for the EC2 instance "
  type        = string
}

variable "instance_type" {
  description = "The type of instane to start"
  type        = string
}

variable "public_ip" {
  description = "Public ip used by EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of an existing key pair .pem used for access to ssh into the instance"
  type        = string
}

variable "user_data" {
  description = "'cloud-init yml' configuration passed into the EC2 instance"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID attached to the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string


}

