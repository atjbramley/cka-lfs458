terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

resource "google_compute_instance" "ansible_vm" {
  name         = "ansible-vm"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-2404-noble-amd64-v20251014"
    }
  }

  network_interface {
    network = "default"
    access_config {} # ensures a public IP is assigned
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: ansible
          groups: sudo
          shell: /bin/bash
          sudo: ALL=(ALL) NOPASSWD:ALL
          ssh-authorized-keys:
            - ${file("~/.ssh/google_compute_engine.pub")}

      packages:
        - python3
        - python3-apt
    EOF
  }
}

output "ansible_vm_ip" {
  value = google_compute_instance.ansible_vm.network_interface[0].access_config[0].nat_ip
}
