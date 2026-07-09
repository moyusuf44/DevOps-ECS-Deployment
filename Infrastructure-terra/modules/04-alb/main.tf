resource "aws_lb" "this" {
    name = "code-server-terra-alb"
    internal = false
    load_balancer_type = "application"
    
    security_groups = [var.security_group]
    
    subnets = var.subnet_ids
}

resource "aws_lb_target_group" "this" {
    name = "code-server-terra-alb-tg-v1"
    port = "8080"
    protocol = "HTTP"
    vpc_id = var.vpc_id
    target_type = "ip"

    lifecycle {
        create_before_destroy = true #enables target group to be deleted on apply and made anew
    }

    health_check {
        path = "/"
        port = "8080"
        matcher = "200-399"
    }
}

resource "aws_lb_listener" "this" {
    load_balancer_arn = aws_lb.this.arn
    port = "8080"
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.this.arn
    }
}