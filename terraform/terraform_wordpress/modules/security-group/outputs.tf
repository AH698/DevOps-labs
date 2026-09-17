output "security_group_id" {
  description = "Security group id"
  value       = aws_default_security_group.default.id
}