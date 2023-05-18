variable "REGION" {
  type    = string
  default = "us-east-1"
}

variable "KEY_NAME" {
  type = string
}

variable "RSA_FILE_NAME" {
  type = string
}

variable "TAG" {
  type = string
}

variable "VPC_CIDR" {
  type = string
}

variable "PUBLIC_SUBNET1" {
  type = string
}

variable "PUBLIC_SUBNET2" {
  type = string
}

variable "PRIVATE_SUBNET1" {
  type = string
}

variable "PRIVATE_SUBNET2" {
  type = string
}

variable "DEFAULT_CIDR" {
  type = string
}

variable "DEFAULT_IP6_CIDR" {
  type = string
}

variable "PUBLIC_SUBNET1_AZ" {
  type = string
}

variable "PUBLIC_SUBNET2_AZ" {
  type = string
}

variable "PRIVATE_SUBNET1_AZ" {
  type = string
}

variable "PRIVATE_SUBNET2_AZ" {
  type = string
}

variable "AMI_ID" {
  type = string
}

variable "SSH_SG_DESC" {
  type = string
}

variable "PRV_SG_DESC" {
  type = string
}

variable "INSTANCE_TYPE" {
  type = string
}

variable "ALB_NAME" {
  type = string
}

variable "ALB_SG_DESC" {
  type = string
}

variable "ALB_TAR_NAME" {
  type = string
}