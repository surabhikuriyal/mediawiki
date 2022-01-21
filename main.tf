#IP ADDRESS CREATION
module "mediawiki_ip" {
  source = "modules/ip-address"
  application = "mediawiki"
}

#VM CREATION
resource "google_compute_instance" "mediawiki-instance" {
  source = "modules/instance-group"
  linux = "true"
  application = "mediawiki"
  project_name = var.project_name
  machine_type = var.machine_type
  region = var.region
  tags = [
    "${var.project_name}-firewall-ssh",
    "${var.project_name}-firewall-http",
    "${var.project_name}-firewall-https"
  ]
  ip_address = module.mediawiki_ip.ip_address
  image = "<image path>"
  disk_size = var.disk_size
  ports = [443, 80]
  metadata {
    hostname = "mediawiki.in"
  }
  enable_attached_disk = "true"
  attached_disk_size = var.attached_disk_size
}