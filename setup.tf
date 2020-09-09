provider "google" {
  region = "${var.region}"
  project = "${var.project_name}"
  credentials = "${file("${var.credentials_file_path}")}"
}

resource "google_compute_instance" "app" {
  name = "tf-app"
  machine_type = "f1-micro"
  zone = "${var.region_zone}"

  boot_disk {
      initialize_params {
        image = "packer-1583410846"
  }
  }

  network_interface {
    network = "default"
    access_config {
      # Ephemeral
    }
  }

  metadata {
    ssh-keys = "root:${file("${var.public_key_path}")}"
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }
}

resource "google_compute_firewall" "default" {
  name = "tf-www-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["web"]
}

test