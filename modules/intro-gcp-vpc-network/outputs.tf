output "ssh_command-cp" {
  description = "gcloud command to SSH to the control plane VM"
  value = { for k, v in google_compute_instance.lfs_cp :
    k => "gcloud compute ssh --zone ${v.zone} ${v.name} --project ${var.project}"
  }
}
