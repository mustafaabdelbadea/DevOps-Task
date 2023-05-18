resource "aws_instance" "publicInstance1" {
  ami           = var.AMI_ID
  instance_type = var.INSTANCE_TYPE

  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  subnet_id                   = module.network.pub_subnet1
  associate_public_ip_address = true
  key_name                    = var.KEY_NAME

  user_data = <<-EOF
   #!/bin/bash
   sudo apt update -y
   sudo apt install nginx -y
   sudo systemctl enable nginx
   sudo systemctl start nginx
   echo "<html><body><div>Pub $(hostname -f)</div></body></html>" > /usr/share/nginx/html/index.html
   EOF
}

resource "aws_instance" "privateInstance1" {
  ami                         = var.AMI_ID
  instance_type               = var.INSTANCE_TYPE
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh_custom.id]
  subnet_id                   = module.network.prv_subnet1
  key_name                    = var.KEY_NAME

  user_data = <<-EOF
   #!/bin/bash
   sudo apt update -y
   sudo apt install nginx -y
   sudo systemctl enable nginx
   sudo systemctl start nginx
   echo "<html><body><div>Pub $(hostname -f)</div></body></html>" > /usr/share/nginx/html/index.html
   EOF
}

resource "aws_instance" "privateInstance2" {
  ami                         = var.AMI_ID
  instance_type               = var.INSTANCE_TYPE
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.allow_ssh_custom.id]
  subnet_id                   = module.network.prv_subnet2
  key_name                    = var.KEY_NAME


  user_data = <<-EOF
   #!/bin/bash
   sudo apt update -y
   sudo apt install nginx -y
   sudo systemctl enable nginx
   sudo systemctl start nginx
   echo "<html><body><div>Pub $(hostname -f)</div></body></html>" > /usr/share/nginx/html/index.html
   EOF
}
