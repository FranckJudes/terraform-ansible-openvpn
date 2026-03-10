output "network_id" {
  description = "The Id of the network"
  value = openstack_networking_network_v2.network_internal.id
}