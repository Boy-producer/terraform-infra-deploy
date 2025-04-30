resource "google_compute_network" "vpc_network" {
  project                 = "bank-app"
  name                    = "private-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}