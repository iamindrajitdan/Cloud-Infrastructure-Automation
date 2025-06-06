variable "gcp_credentials_file" {
  description = "The path to the GCP credentials file"
}

variable "gcp_project" {
  description = "The GCP project ID"
}

variable "gcp_region" {
  description = "The GCP region"
}

variable "gcp_zone" {
  description = "The GCP zone"
}

variable "vm_name" {
  description = "The name of the VM instance"
}

variable "vm_machine_type" {
  description = "The machine type of the VM instance"
}

variable "vm_image" {
  description = "The image for the VM instance"
}

variable "vm_network" {
  description = "The network for the VM instance"
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
}

variable "script_name" {
  description = "The name of the script to upload"
}

variable "script_path" {
  description = "The path to the script to upload"
}