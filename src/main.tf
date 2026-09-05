
####==================Задание 3=========================
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = "${var.vpc_name}-db"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

# Образ для web
data "yandex_compute_image" "ubuntu" {
  family = var.vms_resources.web.image_family
}

# Образ для db
data "yandex_compute_image" "ubuntu_db" {
  family = var.vms_resources.db.image_family
}

# ВМ web
resource "yandex_compute_instance" "platform" {
  name        = local.web_name
  platform_id = var.vms_resources.web.platform_id
  zone        = var.vms_resources.web.zone

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vms_resources.web.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = var.metadata
}

# ВМ db
resource "yandex_compute_instance" "db" {
  name        = local.db_name
  platform_id = var.vms_resources.db.platform_id
  zone        = var.vms_resources.db.zone

  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_db.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vms_resources.db.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = true
  }

  metadata = var.metadata
}