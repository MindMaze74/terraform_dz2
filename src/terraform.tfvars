cloud_id  = "b1gervu69v9ig93k4v83"
folder_id = "b1g4blc2guo29mqbh6bp"

vms_ssh_public_root_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbL5ruQjldbYhJpcuYLJuA17V3V/EQvYP9T3WLCcnw7Igr8tHlvCJnN+8D7R7YBJ6nPHKXS0i3g9eRLcMdt7VJGXp8qyAkHQ+2v5BNYWGOZSKp+RiOad4oGbo16IEPax3pOD/Hrzs5ctfy6Kjv1ePcI8i039eXILqzTaMI4vI2Y1tWoMNs4B1EFknhLi/SdF3MCZTjme8cq962c3OhL4nd47NafhYiHBvIUDzVWYPG/donLW2zcsYXDKBDXPX1OdtDWD/vaHoAO3dG7fH3ApHWsCJyj+sNPzyFFw4ZIphe86QwqpQ0+1yYYCuWAhMhAoeEpL7POIi9ujAY658rx0H5 user@ubuntu24"

vms_resources = {
  web = {
    cores         = 2
    memory        = 1
    core_fraction = 5
    zone          = "ru-central1-a"
    platform_id   = "standard-v2"
    image_family  = "ubuntu-2004-lts"
    preemptible   = true
  }
  db = {
    cores         = 2
    memory        = 2
    core_fraction = 20
    zone          = "ru-central1-b"
    platform_id   = "standard-v2"
    image_family  = "ubuntu-2004-lts"
    preemptible   = true
  }
}

metadata = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbL5ruQjldbYhJpcuYLJuA17V3V/EQvYP9T3WLCcnw7Igr8tHlvCJnN+8D7R7YBJ6nPHKXS0i3g9eRLcMdt7VJGXp8qyAkHQ+2v5BNYWGOZSKp+RiOad4oGbo16IEPax3pOD/Hrzs5ctfy6Kjv1ePcI8i039eXILqzTaMI4vI2Y1tWoMNs4B1EFknhLi/SdF3MCZTjme8cq962c3OhL4nd47NafhYiHBvIUDzVWYPG/donLW2zcsYXDKBDXPX1OdtDWD/vaHoAO3dG7fH3ApHWsCJyj+sNPzyFFw4ZIphe86QwqpQ0+1yYYCuWAhMhAoeEpL7POIi9ujAY658rx0H5 user@ubuntu24"
}