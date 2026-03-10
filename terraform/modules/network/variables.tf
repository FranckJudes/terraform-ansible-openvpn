variable "network_subnet_cidr" {
  type    = string
}

variable "network_name" {
  type = string
}

variable "network_subnet_ip_version" {
  type = number
  default = 4
}

variable "router_id" {
  type = string
}

variable "network_subnet_dhcp_enable" {
  type = string
  default = true
}

variable "network_subnet_dns" {
  type = list(string)
  default = ["8.8.8.8", "1.1.1.1"]
}