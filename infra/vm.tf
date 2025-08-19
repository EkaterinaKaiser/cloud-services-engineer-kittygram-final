data "yandex_compute_image" "image" {
  family = var.image_family
} 

resource "yandex_compute_instance" "vm_1" {
  name     = var.vm_1_name
  hostname = var.vm_1_name
  zone     = var.zone
  platform_id = var.platform_id
  allow_stopping_for_update = true

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      type     = var.disk_type
      image_id = data.yandex_compute_image.image.id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id            = yandex_vpc_subnet.infra_subnet[0].id
    nat                  = var.nat
    nat_ip_address       = var.static_ip_address
    security_group_ids   = [yandex_vpc_security_group.infra_sg.id]
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    serial-port-enable = "1"
    ssh-keys = "user=${var.ssh_key}"
    user-data = templatefile("${path.module}/init/vm-install.yml", 
    {
      SSH_KEY = var.ssh_key
    })
  }
}