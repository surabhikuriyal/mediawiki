resource "google_compute_address" "static_ip" {
  name = "${var.project_name}-${var.application}-address"
  project = var.project_name
  address_type = "INTERNAL"
  region = var.region
  address = var.ip_address
  lifecycle {
      prevent_destroy = true
  }
}