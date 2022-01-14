# Management subnet
resource "google_compute_subnetwork" "management" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.10.0/24"
  region        = "europe-west1"
  network       = google_compute_network.final_vpc.id
}

# Restricted subnet
resource "google_compute_subnetwork" "restricted" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.11.0/24"
  region        = "europe-west1"
  network       = google_compute_network.final_vpc.id
}