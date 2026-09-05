### vm_db variables

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Имя ВМ db"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Платформа ВМ db"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Количество vCPU для db"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Объём RAM для db в ГБ"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Гарантированная доля vCPU для db"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образа для db"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемость db"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона для db"
}