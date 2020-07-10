# - OUTPUT COMMON ---------------------------------------

# -- OUTPUT CREDS ---------------------------------------

output "f5_password" {
  value = "${random_string.password.result}"
}

output "f5_username" {
  value = "${var.username}"
}

# - OUTPUT CONSUL -----------------------------------------

output "consul_ui" {
  value = "http://${aws_instance.consul.public_ip}:8500"
}

# - OUTPUT F5-1 -------------------------------------------

# -- OUTPUT F5-1 MGMT -------------------------------------

output "f5-1_eth0_mgmt_pub_ip" {
  value = "${aws_eip.f5-1_eth0_mgmt.public_ip}"
}

data "aws_subnet" "f5-1_eth0_mgmt" {
  id = module.vpc.public_subnets[0]
}
output "f5-1_eth0_mgmt_cidr" {
  value = data.aws_subnet.f5-1_eth0_mgmt.cidr_block
}

output "f5-1_ui" {
  value = "https://${aws_eip.f5-1_eth0_mgmt.public_ip}:${var.port}"
}

output "f5-1_ssh" {
  value = "ssh admin@${aws_eip.f5-1_eth0_mgmt.public_ip} -i ssh-key.pem"
}

# -- OUTPUT F5-1 EXT -------------------------------------

output "f5-1_eth1_1_ext_pub_ip" {
  value = "${aws_eip.f5-1_eth1_1_ext.public_ip}"
}

output "f5-1_eth1_1_ext_ip" {
  value = "${aws_network_interface.f5-1_eth1_1_ext.private_ip}"
}

data "aws_subnet" "f5-1_eth1_1_ext" {
  id = module.vpc.public_subnets[1]
}
output "f5-1_eth1_1_ext_cidr" {
  value = data.aws_subnet.f5-1_eth1_1_ext.cidr_block
}

# -- OUTPUT F5-1 INT -------------------------------------

output "f5-1_eth1_2_int_ip" {
  value = "${aws_network_interface.f5-1_eth1_2_int.private_ip}"
}

data "aws_subnet" "f5-1_eth1_2_int" {
  id = module.vpc.private_subnets[0]
}
output "f5-1_eth1_2_int_cidr" {
  value = data.aws_subnet.f5-1_eth1_2_int.cidr_block
}

# - OUTPUT F5-2 -------------------------------------------

# -- OUTPUT F5-2 MGMT -------------------------------------

output "f5-2_eth0_mgmt_pub_ip" {
  value = "${aws_eip.f5-2_eth0_mgmt.public_ip}"
}

data "aws_subnet" "f5-2_eth0_mgmt" {
  id = module.vpc.public_subnets[2]
}
output "f5-2_eth0_mgmt_cidr" {
  value = data.aws_subnet.f5-2_eth0_mgmt.cidr_block
}

output "f5-2_ui" {
  value = "https://${aws_eip.f5-2_eth0_mgmt.public_ip}:${var.port}"
}

output "f5-2_ssh" {
  value = "ssh admin@${aws_eip.f5-2_eth0_mgmt.public_ip} -i ssh-key.pem"
} 

# -- OUTPUT F5-2 EXT -------------------------------------

output "f5-2_eth1_1_ext_pub_ip" {
  value = "${aws_eip.f5-2_eth1_1_ext.public_ip}"
}

output "f5-2_eth1_1_ext_ip" {
  value = "${aws_network_interface.f5-2_eth1_1_ext.private_ip}"
}

data "aws_subnet" "f5-2_eth1_1_ext" {
  id = module.vpc.public_subnets[3]
}
output "f5-2_eth1_1_ext_cidr" {
  value = data.aws_subnet.f5-2_eth1_1_ext.cidr_block
}

# -- OUTPUT F5-2 INT -------------------------------------

output "f5-2_eth1_2_int_ip" {
  value = "${aws_network_interface.f5-2_eth1_2_int.private_ip}"
}

data "aws_subnet" "f5-2_eth1_2_int" {
  id = module.vpc.private_subnets[2]
}
output "f5-2_eth1_2_int_cidr" {
  value = data.aws_subnet.f5-2_eth1_2_int.cidr_block
}

# -- END OUTPUT -----------------------------------------