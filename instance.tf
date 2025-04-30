resource "google_service_account" "default" {
  account_id   = "my-service"
  display_name = "Custom SA for VM Instance"
}

resource "google_compute_instance" "default" {
  name         = "web-server"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  tags = ["web-server", "bar"]

   metadata = {
  ssh-keys = "lance:${file("~/.ssh/id_rsa.pub")}"
  foo = "bar"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
    auto_delete = true
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }


  network_interface {
    network = "front-end-subnet"

    access_config {
      // Ephemeral public IP
    }
  }


  

  metadata_startup_script = "echo hi > /test.txt"
  

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
  
}