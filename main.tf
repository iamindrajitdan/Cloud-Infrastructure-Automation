resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.gcp_region
  force_destroy = true
}

resource "google_storage_bucket_iam_member" "public_access" {
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_storage_bucket_object" "upload_script" {
  name   = var.script_name
  bucket = google_storage_bucket.bucket.name
  source = var.script_path
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.gcp_zone

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  network_interface {
    network       = var.vm_network
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
      sudo apt-get update -y
      cd /tmp
      curl -o /tmp/startup_script.sh https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${var.script_name}
      sudo chmod 777 /tmp/startup_script.sh
      bash startup_script.sh
  EOT
  depends_on = [
    google_storage_bucket_object.upload_script
  ]
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = var.vm_network

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
