terraform {
  required_providers {
    google = {
    source = "hashicorp/google" }
  }
}

resource "google_compute_network" "lfclass_458_initial_setup-network" {
  name                    = "lfclass-458-tf"
  project                 = "cka-lfs-458"
  description             = "lfs-458-tf-created-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "lfclass_458_initial_setup-subnet" {
  name          = "lfclass-458-initial-setup-tf-created"
  project       = "cka-lfs-458"
  description   = "First setup for LFclass 458 - created by Terraform"
  ip_cidr_range = "10.4.0.0/16"
  region        = var.location
  network       = google_compute_network.lfclass_458_initial_setup-network.id
  stack_type    = "IPV4_ONLY"
}

resource "google_compute_firewall" "cka_allow_all" {
  name          = "cka-allow-all"
  description   = "Allow everything for LFS CKA Study"
  network       = google_compute_network.lfclass_458_initial_setup-network.id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "all"
  }

  project = "cka-lfs-458"
}

# CP VM instance(s)
resource "google_compute_instance" "lfs_cp" {
  for_each     = var.cp-vms
  name         = each.key == "cp" ? "lfs-cp" : "lfs-${each.key}"
  machine_type = each.value
  zone         = "europe-west12-c"

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20250924"
      size  = 20
      type  = "pd-balanced"
    }
    auto_delete = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.lfclass_458_initial_setup-subnet.id
    stack_type = "IPV4_ONLY"

    access_config {
      network_tier = "PREMIUM" # Ephemeral public IP
    }
  }

  metadata = {
    enable-osconfig = "TRUE"
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }

  # service_account {
  #   email  = "465450448891-compute@developer.gserviceaccount.com"
  #   scopes = [
  #     "https://www.googleapis.com/auth/devstorage.read_only",
  #     "https://www.googleapis.com/auth/logging.write",
  #     "https://www.googleapis.com/auth/monitoring.write",
  #     "https://www.googleapis.com/auth/service.management.readonly",
  #     "https://www.googleapis.com/auth/servicecontrol",
  #     "https://www.googleapis.com/auth/trace.append",
  #   ]
  # }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  labels = {
    goog-ops-agent-policy = "v2-x86-template-1-4-0"
    goog-ec-src           = "vm_add-gcloud"
  }

  reservation_affinity {
    type = "ANY_RESERVATION"
  }
}

# # Ops Agent Policy Assignment
# resource "google_os_config_os_policy_assignment" "ops_agent" {
#   name     = "goog-ops-agent-v2-x86-template-1-4-0-europe-west12-c"
#   location = "europe-west12-c"

#   os_policies {
#     id   = "install-ops-agent"
#     mode = "ENFORCEMENT"

#     resource_groups {
#       inventory_filters {
#         os_short_name = "ubuntu"
#       }

#       resources {
#         pkg {
#           desired_state = "INSTALLED"
#           apt {
#             name = "google-cloud-ops-agent"
#           }
#         }
#       }
#     }
#   }

#   instance_filter {
#     inclusion_labels {
#       labels = {
#         goog-ops-agent-policy = "v2-x86-template-1-4-0"
#       }
#     }
#   }

#   rollout {
#     disruption_budget {
#       fixed = 1
#     }
#     min_wait_duration = "60s"
#   }
# }
