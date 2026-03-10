
# resource "openstack_compute_secgroup_v2" "ssh" {
#   name        = "ssh"
#   description = "my ssh group"

#   rule {
#     from_port   = 22
#     to_port     = 22
#     ip_protocol = "tcp"
#     cidr        = "0.0.0.0/0"
#   }
# }

# resource "openstack_compute_secgroup_v2" "openvpn" {
#   name        = "openvpn"
#   description = "my openvpn group"

#   rule {
#     from_port   = 1194
#     to_port     = 1194
#     ip_protocol = "udp"
#     cidr        = "0.0.0.0/0"
#   }
# }


# resource "openstack_compute_secgroup_v2" "ssh_internal" {
#   name        = "ssh_internal"
#   description = "my openvpn group"

#   rule {
#     from_port   = 22
#     to_port     = 22
#     ip_protocol = "tcp"
#     cidr        = var.network_subnet_cidr
#   }
# }


# resource "openstack_compute_secgroup_v2" "all_internal" {
#   name        = "all_internal"
#   description = "my all_internal group"

#   rule {
#     from_port   = 1
#     to_port     = 65535
#     ip_protocol = "tcp"
#     cidr        = var.network_subnet_cidr
#   }

#   rule {
#     from_port   = 1
#     to_port     = 65535
#     ip_protocol = "udp"
#     cidr        = var.network_subnet_cidr
#   }
# }


# resource "openstack_compute_secgroup_v2" "proxy" {
#   name        = "proxy"
#   description = "my proxy group"

#   rule {
#     from_port   = 1
#     to_port     = 65535
#     ip_protocol = "tcp"
#     cidr        = "0.0.0.0/0"
#   }

#   rule {
#     from_port   = 1
#     to_port     = 65535
#     ip_protocol = "udp"
#     cidr        = "0.0.0.0/0"
#   }
# }

resource "openstack_networking_secgroup_v2" "ssh" {
  name        = "ssh"
  description = "My ssh security group"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_ssh_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.ssh.id
}


resource "openstack_networking_secgroup_v2" "openvpn" {
  name        = "openvpn"
  description = "My openvpn security group"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_openvpn_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1194
  port_range_max    = 1194
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.openvpn.id
}
resource "openstack_networking_secgroup_rule_v2" "secgroup_openvpn_rule_v4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 1194
  port_range_max    = 1194
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.openvpn.id
}



resource "openstack_networking_secgroup_v2" "ssh_internal" {
  name        = "ssh_internal"
  description = "My ssh internal security group"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_ssh_internal_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.network_subnet_cidr
  security_group_id = openstack_networking_secgroup_v2.ssh_internal.id
}


resource "openstack_networking_secgroup_v2" "all_internal" {
  name        = "all_internal"
  description = "My all internal security group"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_all_internal_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = var.network_subnet_cidr
  security_group_id = openstack_networking_secgroup_v2.all_internal.id
}
resource "openstack_networking_secgroup_rule_v2" "secgroup_all_internal_rule_2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 1
  port_range_max    = 65535
  remote_ip_prefix  = var.network_subnet_cidr
  security_group_id = openstack_networking_secgroup_v2.all_internal.id
}


resource "openstack_networking_secgroup_v2" "proxy" {
  name        = "proxy"
  description = "My proxy security group"
}

resource "openstack_networking_secgroup_rule_v2" "secgroup_proxy_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.proxy.id
}