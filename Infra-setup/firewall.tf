resource "google_compute_firewall" "allow-iap-ssh" {
  name    = "allow-iap-ssh"
  network = google_compute_network.private-vpc.name
  allow {
    protocol = "tcp"
    ports    = [22]
  }

  source_ranges = ["35.235.240.0/20"]

  target_tags = [ "app-compute-server" ]

}

resource "google_compute_firewall" "allow-db" {
  name    = "allow-db"
  network = google_compute_network.private-vpc.name
  allow {
    protocol = "tcp"
    ports    = [3306]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = [ "app-compute-server" ]

}