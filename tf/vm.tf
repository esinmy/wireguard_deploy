resource "yandex_compute_instance" "ya_vms" {
  count    = length(var.vms)

  name     = "${var.username}-${var.vms[count.index].metainfo.name}"

  resources {
    cores           = var.vms[count.index].resources.cores
    core_fraction   = var.vms[count.index].resources.core_fraction
    memory          = var.vms[count.index].resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.images[count.index].id
      size     = var.vms[count.index].resources.disk_size
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.subnets[count.index].id
    nat       = true
  }

  metadata = {
    user-data = data.template_file.cloud_config.rendered
  }

  labels = {
    module       = var.module_tag
    user_email   = var.user_email
  }
}