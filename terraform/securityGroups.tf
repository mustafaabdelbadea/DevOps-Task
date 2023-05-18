resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = var.SSH_SG_DESC
  vpc_id      = module.network.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.DEFAULT_CIDR]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.DEFAULT_CIDR]
    ipv6_cidr_blocks = [var.DEFAULT_IP6_CIDR]
  }

  tags = {
    Name = var.TAG
  }
}


resource "aws_security_group" "allow_ssh_custom" {
  name        = "allow_ssh_custom"
  description = var.PRV_SG_DESC
  vpc_id      = module.network.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr]
  }


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.DEFAULT_CIDR]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.DEFAULT_CIDR]
    ipv6_cidr_blocks = [var.DEFAULT_IP6_CIDR]
  }

  tags = {
    Name = var.TAG
  }
}


resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = var.ALB_SG_DESC
  vpc_id      = module.network.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.DEFAULT_CIDR]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.DEFAULT_CIDR]
    ipv6_cidr_blocks = [var.DEFAULT_IP6_CIDR]
  }

  tags = {
    Name = var.TAG
  }
}