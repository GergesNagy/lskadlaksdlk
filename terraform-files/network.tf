# Router
resource "google_compute_router" "final_router" {
  name    = "final-router"
  region  = google_compute_subnetwork.management.region
  network = google_compute_network.final_vpc.id

  bgp {
    asn = 64514
  }
}
# Nat- gateway
resource "google_compute_router_nat" "final_nat_gateway" {
  name                               = "final-router-nat"
  router                             = google_compute_router.final_router.name
  region                             = google_compute_router.final_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.management.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
# service for instance
resource "google_service_account" "instance_sarvice" {
  account_id   = "instance-service-account-id"
  display_name = "final_Service_Account"
}
resource "google_project_iam_binding" "final_project" {
  project = "rock-extension-337315"
  role    = "roles/container.admin"

  members = [
    "serviceAccount:${google_service_account.instance_sarvice.email}"
  ]
}

# firewall role to allow access only through IAP
resource "google_compute_firewall" "default-fw" {
  name    = "test-firewall"
  network = google_compute_network.final_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "22"]
  }
  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
}