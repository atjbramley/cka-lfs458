variable "location" {
  description = "The location/region for the VCP network"
  type        = string
}

variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "cp-vms" {
  description = "Map of control plane VMs to create"
  type = map(string)
  default = {
    "cp-1" = "e2-standard-2"
    # "cp-2" = "e2-standard-2"
  }
}

variable "worker-vms" {
  description = "Map of worker VMs to create"
  type = map(string)
  default = {
    "worker-1" = "e2-standard-2"
    "worker-2" = "e2-standard-2"
  }
}
