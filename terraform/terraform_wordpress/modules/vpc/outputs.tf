output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
  type = string
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = aws_subnet.main.id
}