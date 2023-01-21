resource "local_file" "ansible_inventory" {
  filename = var.inventory_path
  content  = <<-EOF
all:
  children:
    ya:
      hosts:
        %{~ for index, vm in yandex_compute_instance.ya_vms ~}
        ${vm.name}:
          ansible_host: "${vm.network_interface.0.nat_ip_address}"
        %{~ endfor ~}
      vars:
        ansible_user: "${var.username}"
        ansible_ssh_private_key_file: "${var.personal_private_ssh_key_path}"
EOF
}