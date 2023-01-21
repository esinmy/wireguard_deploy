variable "ya_service_account_key_file" {
  type        = string
  description = "Yandex Cloud service account key file"
}

variable "ya_cloud_id" {
  type        = string
  description = "Yandex Cloud Id"
}

variable "ya_folder_id" {
  type        = string
  description = "Yandex Folder Id"
}

variable "ya_zone" {
  type        = string
  description = "Yandex availability zone"
  default     = "ru-central1-a"
}


variable personal_pub_ssh_key {
  type        = string
  description = "Personal public SSH key"
}


variable personal_private_ssh_key_path {
  type        = string
  description = "Path to user's private ssh key file"
}

variable "vms" {
  type = list(object({
    metainfo  = map(string)
    resources = map(number)
  }))
  description = "List of Yandex compute instance"
}

variable username {
  type        = string
  description = "Your login for vms"
}

variable user_email {
  type        = string
  description = "Your email in a proper format (e.g. ii_at_rebrainme_com)"
}

variable module_tag {
  type        = string
  default     = "devops"
  description = "This tag is to specifying the current training module"
}

variable inventory_path {
  type        = string
  default     = "../ansible/inventory.yaml"
  description = "Ansible inventory file location"
}

variable playbook_path {
  type        = string
  default     = "../ansible/playbook.yaml"
  description = "Ansible playbook file location"
}

variable cloud_config_path {
  type        = string
  default     = "./cloud-config.tftpl"
  description = "Path to your cloud config file"
}