variable "name"                { }
variable "vpc_ids"             { }
variable "key_name"            { }
variable "azs"                 { }
variable "public_subnet_ids"   { }
variable "web_instance_type"   { }
variable "web_instance_ami_id" { }

module "web" {
  source = "./web"

  name              = "${var.name}-web"
  vpc_ids           = "${var.vpc_ids}"
  key_name          = "${var.key_name}"
  azs               = "${var.azs}"
  public_subnet_ids = "${var.public_subnet_ids}"
  instance_type     = "${var.web_instance_type}"
  instance_ami_id   = "${var.web_instance_ami_id}"
}

output "web_public_ips"  { value = "${module.web.public_ips}" }
output "web_private_ips" { value = "${module.web.private_ips}" }
