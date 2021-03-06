# General
name              = "serverspec-demo"
region            = "ap-northeast-1"
site_public_key   = "REPLACE_IN_ATLAS"
atlas_environment = "REPLACE_IN_ATLAS"
atlas_token       = "REPLACE_IN_ATLAS"
atlas_username    = "REPLACE_IN_ATLAS"

# Network
vpc_cidr       = "172.16.0.0/16"
azs            = "ap-northeast-1a,ap-northeast-1c"
public_subnet  = "172.16.0.0/24"
private_subnet = "172.16.1.0/24"

# Bastion
bastion_artifact_type    = "amazon.image"
bastion_artifact_name    = "REPLACE_IN_ATLAS"
bastion_artifact_version = "1"

# EC2
ec2_instance_type   = "t2.micro"
ec2_instance_ami_id = "ami-383c1956"

# DNS
domain      = "knakayama.io"
sub_domains = "web1,db1"
