resource "google_compute_instance" "vm-tf" {
  name = "vm-tf"
  boot_disk {
    auto_delete = false
    initialize_params {
      image = "debian-9-stretech-v20210916"
      size = 20
    }
  }
  network_interface {
    network = "custom-vpc-tf"
    subnetwork = "sub-sg"
  }
  machine_type = "n2-standard-2"
  zone = "asia-southeast1-a"
  labels = {
    env = "dev"
  }

  # lifecycle {
  #   ignore_changes = [ attachTFDisk ]
  # }

  //attach service account in VM
  # service_account {
  #   email = ""
  #   scopes = ["cloud-platform"]
  # }

  //this below variable is used stopping the instance while updating the configuration 
  #allow_stopping_for_update = true
}

resource "google_compute_disk" "TFDisk" {
  name = "TFDisk"
  size = 15
  zone = "asia-southeast1-a"
  type = "pd-ssd" 
}

resource "google_compute_attached_disk" "attachTFDisk" {
  disk = google_compute_disk.TFDisk.name
  instance = google_compute_instance.vm-tf.name  
}