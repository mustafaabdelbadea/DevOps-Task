REGION             = "us-east-1"
KEY_NAME           = "Prod-key"
RSA_FILE_NAME      = "Prod-key.pem"
TAG                = "Terraform-Production"
SLAVE_TAG          = "Slave-Node"
VPC_CIDR           = "172.0.0.0/16"
PUBLIC_SUBNET1     = "172.0.1.0/24"
PUBLIC_SUBNET2     = "172.0.2.0/24"
PRIVATE_SUBNET1    = "172.0.3.0/24"
PRIVATE_SUBNET2    = "172.0.4.0/24"
DEFAULT_CIDR       = "0.0.0.0/0"
DEFAULT_IP6_CIDR   = "::/0"
PUBLIC_SUBNET1_AZ  = "us-east-1a"
PUBLIC_SUBNET2_AZ  = "us-east-1b"
PRIVATE_SUBNET1_AZ = "us-east-1a"
PRIVATE_SUBNET2_AZ = "us-east-1b"
AMI_ID             = "ami-069aabeee6f53e7bf"
INSTANCE_TYPE      = "t2.micro"
ALB_NAME           = "App-load"
SSH_SG_DESC        = "Allow ssh inbound traffic"
PRV_SG_DESC        = "Allow Custom inbound traffic"
ALB_SG_DESC        = "Allow Http for loadbalancer"
ALB_TAR_NAME       = "ALB-Target"
DB_STORAGE                 = 10
DB_NAME                    = "mydb"
DB_ENGINE                  = "mysql"
ENGINE_VERSION             = "5.7"
DB_INSTANCE_CLASS          = "db.t3.micro"
PARAMETER_G_N_DB           = "default.mysql5.7"
DB_CLUSTER                 = "terraform"
DB_CACHE_ENGINE            = "redis"
DB_NODE_TYPE               = "cache.t4g.micro"
NUM_CAHCE_NODES            = 1
CACHE_PARAMETER_GROUP_NAME = "default.redis5.0"
ENGINE_VERSION_CACHE       = "5.0.6"
CACHE_PORT                 = 6379
USER_NAME                  = "admin"