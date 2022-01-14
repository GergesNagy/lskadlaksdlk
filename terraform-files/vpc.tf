# vpc resource
resource "google_compute_network" "final_vpc" {
  project                 = "rock-extension-337315"
  name                    = "final-vpc"
  auto_create_subnetworks = false
}
