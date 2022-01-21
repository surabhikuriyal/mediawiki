resource "google_compute_instance_template" "mediawiki-linux" {
  project = var.project_name
  machine_type = var.machine_type
  tags = var.tags
  disk {
      device_name = "${var.project_name}-boot-disk"
      auto_delete = true
      source_image = var.image
      disk_size_gb = var.disk_size
      boot = true
  }
  metadata = var.metadata
  service_account {
    email = "${var.application}@${var.project_name}.iam.gserviceaccount.com"
  }
  lifecycle {
      create_before_destroy = true
  }
}