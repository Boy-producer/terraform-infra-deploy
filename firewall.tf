resource "google_compute_firewall" "default" {
  name    = "front-end"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443"]
  }

  source_tags = ["web-server"]

        source_ranges = ["203.0.113.10/32", "233.30.12.54"]

    direction = "INGRESS"

    priority  = 1000
}

