
module "openvpn" {
  source                         = "../modules/instance"
  instance_name                  = "openvpn"
  instance_count                 = 1
  instance_network_external_id   = var.network_external_id
  instance_network_external_name = var.network_extenal_name
  instance_network_internal_name = var.network_internal_dev
  # instance_internal_fixed_ip     = "10.0.1.1" 
  instance_ssh_key = var.ssh_public_key_default_user
  instance_volumes_count = 2
  public_floating_ip = true
  metadatas = {
    "environmement" = "dev"
  }

  instance_key_pair        = openstack_compute_keypair_v2.ssh_public_key.name
  instance_security_groups = [openstack_networking_secgroup_v2.openvpn.name, openstack_networking_secgroup_v2.ssh.name, "default"]

  depends_on = [module.network_dev, openstack_networking_secgroup_rule_v2.secgroup_openvpn_rule_v4]
}