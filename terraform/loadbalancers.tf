# resource "aws_lb" "alb" {
#   name               = var.ALB_NAME
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.allow_http.id]
#   # subnets            = [for subnet in aws_subnet.public : subnet.id]
  
#   subnets = [
#     module.network.pub_subnet1,
#     module.network.pub_subnet2
#   ]

#   enable_deletion_protection = false

#   tags = {
#     Name = var.TAG
#   }
# }

# resource "aws_lb_target_group" "alb_tg" {
#   name     = var.ALB_TAR_NAME
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = module.network.vpc_id

#     health_check {
#     enabled             = true
#     port                = 80
#     interval            = 30
#     protocol            = "HTTP"
#     path                = "/"
#     matcher             = "200"
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#   }
# }

# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.alb.arn
#   port              = "80"
#   protocol          = "HTTP"


#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.alb_tg.arn
#   }
# }


# resource "aws_lb_target_group_attachment" "alb_tar_attach1" {
#   target_group_arn = aws_lb_target_group.alb_tg.arn
#   target_id        = aws_instance.privateInstance1.id
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "alb_tar_attach2" {
#   target_group_arn = aws_lb_target_group.alb_tg.arn
#   target_id        = aws_instance.privateInstance2.id
#   port             = 80
# }