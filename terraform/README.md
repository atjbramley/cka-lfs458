# CKA - LFS-458

Repo to contain IaC used in preparation for the CKA.

## Secrets Management

Secrets are, of course, managed by [Bitwarden Secrets Manager](https://bitwarden.com)

### Access Token

Generate Bitwarden SM Access Token and place in `secrets.auto.tfvars` file in format:

bitwarden_access_token = "<bitwarden_access_token>"

### Demo Secrets

2 demo secrets are referred to in data.tf - make sure that these values tie up

### Machine account + Token

Make sure that access token generated above has read-write access to the project, as this is needed for the resources.tf secret creation.

### Manual registry override

This is a little complicated.

- **1** - Download the correct binary from [GitHub Releases Page](https://github.com/bitwarden/terraform-provider-bitwarden-sm/releases/tag/v0.5.2-pre) and unzip it
- **2** - Rename the binary to terraform-provider-bitwarden-sm
- **3** - run `chmod +x` on the binary
- **4** - Place the binary in the user directory in the following path structure:
`~/.terraform.d/plugins/registry.opentofu.org/bitwarden/bitwarden-sm/0.5.2/darwin_arm64/`
(replacing darwin_arm64 with the correct arch as nececssary)
- **5** - (macOS) - the first time that the binary runs, accept the security exception in System Settings -> Security & Privacy

Full documentation for this step is found in the [Open Tofu CLI Config Docs](https://opentofu.org/docs/cli/config/config-file/#provider-installation)

## Service Account Setup

`ToDo - IaC this`

To set up a service account in Gcloud, a Service User should be provisioned:

`gcloud projects create cka-lfs-458`
`gcloud config set project cka-lfs-458`
`gcloud iam service-accounts create terraform-sa --display-name="Terraform Service Account"`
`gcloud projects add-iam-policy-binding cka-lfs-458 --member="serviceAccount:terraform-sa@cka-lfs-458.iam.gserviceaccount.com" --role="roles/compute.admin"`
`gcloud projects add-iam-policy-binding cka-lfs-458 --member="serviceAccount:terraform-sa@cka-lfs-458.iam.gserviceaccount.com" --role="roles/container.admin"`
`gcloud projects add-iam-policy-binding cka-lfs-458 --member="serviceAccount:terraform-sa@cka-lfs-458.iam.gserviceaccount.com" --role="roles/iam.serviceAccountUser"`
`gcloud projects add-iam-policy-binding cka-lfs-458 --member="serviceAccount:terraform-sa@cka-lfs-458.iam.gserviceaccount.com" --role="roles/storage.admin"`
`gcloud iam service-accounts keys create $(pwd)/credentials/terraform-sa-key.json --iam-account=terraform-sa@cka-lfs-458.iam.gserviceaccount.com`
