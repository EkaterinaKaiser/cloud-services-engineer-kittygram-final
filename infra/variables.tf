variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "infra-network"
}

variable "net_cidr" {
  description = "Subnet structure"
  type = list(object({
    name = string,
    zone = string,
    prefix = string
  }))

  default = [
    { name = "infra-subnet-a", zone = "ru-central1-a", prefix = "10.129.1.0/24" },
    { name = "infra-subnet-b", zone = "ru-central1-b", prefix = "10.130.1.0/24" },
    { name = "infra-subnet-d", zone = "ru-central1-d", prefix = "10.131.1.0/24" },
  ]
}

variable "vm_1_name" {
  type = string
  default = "vm-kittygram"
}

variable "aws_region" {
  description = "AWS Region name"
  type = string
}

variable "ssh_key" {
  description = "SSH Public Key"
  type = string
}

variable "cloud_id" {
  description = "Cloud ID"
  type = string
}

variable "folder_id" {
  description = "Folder ID"
  type = string
}

variable "zone" {
  description = "Default zone"
  type        = string
  default     = "ru-central1-a"
}

variable "image_family" {
  description = "Image family for VM"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "platform_id" {
  description = "Compute platform"
  type        = string
  default     = "standard-v3"
}

variable "cores" {
  description = "vCPU count"
  type        = number
  default     = 2
}

variable "memory" {
  description = "RAM in GB"
  type        = number
  default     = 2
}

variable "disk_type" {
  description = "Boot disk type"
  type        = string
  default     = "network-hdd"
}

variable "disk_size" {
  description = "Boot disk size GB"
  type        = number
  default     = 20
}

variable "nat" {
  description = "Enable NAT"
  type        = bool
  default     = true
}