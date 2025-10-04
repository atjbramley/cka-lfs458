output "ssh_command-cp" {
  description = "gcloud command to SSH to the control plane VM"
  value = { for k, v in google_compute_instance.lfs_cp :
    k => "gcloud compute ssh --zone ${v.zone} ${v.name} --project ${var.project}"
  }
}

output "ssh_command-workers" {
  description = "Map of worker VM names to gcloud SSH commands"
  value = { for worker in google_compute_instance.lfs_worker :
    worker.name => "gcloud compute ssh --zone ${worker.zone} ${worker.name} --project ${var.project}"
  }
}