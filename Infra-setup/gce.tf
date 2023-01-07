resource "google_service_account" "compute_Sa" {
  account_id   = "default"
  display_name = "Service Account"
  depends_on = [
    google_project_service.project_management_services
  ]
}

resource "google_compute_instance" "server" {
  name         = "app-server"
  machine_type = "e2-medium"
  zone         = var.zone

  tags = ["app-compute-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.private-vpc.self_link
    subnetwork = google_compute_subnetwork.vpc-subnetwork.id
  }

  metadata = {
    startup-script = file("scripts/startup_script.sh")
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.compute_Sa.email
    scopes = ["cloud-platform"]
  }

}