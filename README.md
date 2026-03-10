# terraform-ansible-openvpn

A simple project to set up OpenVPN using Terraform and Ansible.

## Description

This repository contains Terraform configurations and Ansible playbooks to automate the deployment of an OpenVPN server.

## Prerequisites

- Terraform
- Ansible
- Access to a cloud provider (e.g., AWS, GCP)

## OpenStack Provider

This project targets OpenStack. Configure the Terraform provider by setting the usual OpenStack environment variables before running Terraform:

```
export OS_AUTH_URL=...
export OS_USERNAME=...
export OS_PASSWORD=...
export OS_PROJECT_NAME=...
export OS_REGION_NAME=...
```

Alternatively, point to a `clouds.yaml` file with `export OS_CLIENT_CONFIG_FILE=~/.config/openstack/clouds.yaml`. Adjust `terraform/vpn/00_providers.tf` if you need a different provider version.

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/FranckJudes/terraform-ansible-openvpn.git
   cd terraform-ansible-openvpn
   ```

2. Install dependencies (if any).

## Usage

1. Configure your Terraform variables.
2. Run `terraform init` and `terraform apply`.
3. Use Ansible to configure the server.

## Creating Clients

After the server is set up, generate client configurations using OpenVPN tools:

1. On the server, use `easy-rsa` or similar to create client certificates.
2. Download the client configuration file (.ovpn).
3. Install OpenVPN client and import the configuration.


