//auto-mode vpc
resource "google_compute_network" "auto-vpc-tf" {
  name = "auto-vpc-tf"
  auto_create_subnetworks = true
}

// custom-mode vpc
resource "google_compute_network" "custom-vpc-tf" {
  name = "custom-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name = "sub-sg"
  ip_cidr_range = "10.1.0.0/24"
  network = google_compute_network.custom-vpc-tf.id
  region = "asia-southeast1"
  private_ip_google_access = true  
}

resource "google_compute_firewall" "allow-80" {
  name = "allow-80"
  network = google_compute_network.custom-vpc-tf.id 
  allow {
    ports = [ 80 ]
    protocol = "TCP"
  }
  source_ranges = ["10.45.0.0/24"]
  priority = 455
}

output "auto" {
  value = google_compute_network.auto-vpc-tf.id
}

output "custom" {
  value = google_compute_network.custom-vpc-tf.id
}