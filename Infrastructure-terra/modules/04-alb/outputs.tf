output "target_group" {
    value = aws_lb_target_group.this.arn
} 

output "alb_dns_name" {
  description = "DNS of the Application Load Balancer"
  value       = aws_lb.this.dns_name
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

