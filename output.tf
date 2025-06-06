output "instance_ip" {
  description = "The public IP address of the VM instance"
  value       = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

output "script_url" {
  description = "The HTTPS URL of the uploaded startup script in GCS"
  value       = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${var.script_name}"
}
