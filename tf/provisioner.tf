resource "null_resource" "run_ansible" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ${var.inventory_path} ${var.playbook_path}"
  }

  triggers = {
    inventory = local_file.ansible_inventory.content
  }
}