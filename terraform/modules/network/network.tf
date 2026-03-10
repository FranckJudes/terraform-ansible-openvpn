resource "openstack_networking_network_v2" "network_internal" {
  name           = var.network_name
  admin_state_up = "true"
}
resource "openstack_networking_subnet_v2" "subnet_1" {
  name            = var.network_name
  network_id      = openstack_networking_network_v2.network_internal.id
  cidr            = var.network_subnet_cidr
  ip_version      = var.network_subnet_ip_version
  enable_dhcp     = var.network_subnet_dhcp_enable
  dns_nameservers = var.network_subnet_dns
}


resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = var.router_id
  subnet_id = openstack_networking_subnet_v2.subnet_1.id
}