# intro-gcp-vpc-network module

output "ssh_command-cp" {
  description = "gcloud command to SSH to the control plane VM"
  value = module.intro-gcp-vcp-network.ssh_command-cp
}
