terraform {
  required_providers {
    yandex = {
        source = "yandex-cloud/yandex"
        version = ">= 0.13"
      }
    local = {
      source = "hashicorp/local"
      version = "2.2.2"
    }
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

provider "yandex" {
  service_account_key_file  = file(var.ya_service_account_key_file)
  cloud_id                  = var.ya_cloud_id
  folder_id                 = var.ya_folder_id
  zone                      = var.ya_zone
}