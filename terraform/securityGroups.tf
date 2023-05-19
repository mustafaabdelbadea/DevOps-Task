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
  ingress {
    from_port   = 3000
    to_port     = 3000
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


resource "aws_security_group" "rds_sg" {
  name   = "rds_sg"
  vpc_id = module.network.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.TAG
  }
}
resource "aws_security_group" "cluster-sg" {
  name   = "cluster-sg"
  vpc_id = module.network.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.TAG
  }
}