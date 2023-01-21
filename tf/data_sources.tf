data "yandex_compute_image" "images" {
  count    = length(var.vms)

  family  = var.vms[count.index].metainfo.image_family
}

data "yandex_vpc_subnet" "subnets" {
  count    = length(var.vms)
  
  name    = var.vms[count.index].metainfo.subnet
}

data "template_file" "cloud_config" {
  template  = templatefile(var.cloud_config_path, {
    username             = var.username,
    personal_pub_ssh_key = var.personal_pub_ssh_key, 
    })
}