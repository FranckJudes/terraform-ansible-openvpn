# resource "null_resource" "openvpn_server" {
#   triggers = {
#     always_run = timestamp()
#   }
#   provisioner "local-exec" {
#     command = <<-EOT
#       sleep 30;
#       echo > /tmp/openvpn.ini;
#       echo "[openvpn]" | tee -a /tmp/openvpn.ini;
#       echo "openvpn ansible_host=${module.openvpn.instance_external_ip_random[0]}" | tee -a /tmp/openvpn.ini;
#       ANSIBLE_CONFIG=../ansible/ansible.cfg ansible-playbook -u gallagher -i /tmp/openvpn.ini --private-key ~/.ssh/info ../ansible/openvpn_server.yml;
#       rm -f /tmp/openvpn.ini;
#     EOT
#   }
#   depends_on = [module.openvpn, module.network_dev]
# }

# resource "null_resource" "create_new_vpn_client" {
#   for_each = toset(var.vpn_user_list)
#   triggers = {
#     name       = each.value
#     always_run = timestamp()
#   }

#   provisioner "local-exec" {
#     command = <<-EOT
#       sleep 30;
#       echo > /tmp/openvpn.ini;
#       echo "[openvpn]" | tee -a /tmp/openvpn.ini;
#       echo "openvpn ansible_host=${module.openvpn.instance_external_ip_random[0]}" | tee -a /tmp/openvpn.ini;
#       ANSIBLE_CONFIG=../ansible/ansible.cfg ansible-playbook -u gallagher -i /tmp/openvpn.ini --private-key ~/.ssh/info -e vpn_user_list=${each.value} ../ansible/openvpn_client.yml;
#       rm -f /tmp/openvpn.ini;
#     EOT
#   }
#   depends_on = [module.openvpn, module.network_dev, null_resource.openvpn_server]
# }