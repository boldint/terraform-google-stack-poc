# Get available kubernetes versions, to be used in GKE!
# Only minor version changes will be tolerated!
data "google_container_engine_versions" "gke_version" {
  provider       = google-beta
  location       = var.gke_region
  project        = var.project_id
  version_prefix = "1.19."
}

# Random resource to add in naming, to avoid naming conflicts
# and GCP resource destruction policy.
resource "random_id" "random" {
  byte_length = 4
}

# Construct default naming policy to be used in all resources!
module "naming" {
  source = "cloudposse/label/null"
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.24.1"

  namespace  = format("%s-%s", var.entity, var.unit)
  stage      = var.environment
  name       = var.projectappservice
  attributes = []

  tags = {
    "ManagedBy" = "Terraform"
  }
}

module "gke" {
  source                  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version                 = "15.0.1"
  project_id              = var.project_id
  name                    = format("%s-%s-%s", module.naming.id, var.gke_suffix, random_id.random.hex)
  regional                = var.gke_regional
  region                  = var.gke_region
  kubernetes_version      = data.google_container_engine_versions.gke_version.latest_master_version
  release_channel         = var.gke_release_channel
  network                 = var.vpc_network
  subnetwork              = var.gke_subnetwork
  ip_range_pods           = var.gke_ip_range_pods
  ip_range_services       = var.gke_ip_range_services
  create_service_account  = var.gke_create_service_account
  enable_private_endpoint = var.gke_enable_private_endpoint
  enable_private_nodes    = var.gke_enable_private_nodes
  #  service_account             = var.compute_engine_service_account
  enable_binary_authorization       = var.gke_enable_binary_authorization
  skip_provisioners                 = var.gke_skip_provisioners
  master_authorized_networks        = var.gke_master_authorized_networks
  zones                             = var.gke_zones
  firewall_inbound_ports            = var.gke_firewall_inbound_ports
  add_master_webhook_firewall_rules = var.gke_add_master_webhook_firewall_rules
}

/*
module "asm-gke" {
  source           = "terraform-google-modules/kubernetes-engine/google//modules/asm"
  version          = "15.0.1"
  asm_version      = "1.9"
  project_id       = var.project_id
  cluster_name     = module.gke.name
  location         = module.gke.location
  cluster_endpoint = module.gke.endpoint

}
*/

# Cloud SQL (PostgreSQL)
module "postgresql_private_service_access" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/private_service_access"
  version = "5.1.1"

  project_id  = var.project_id
  vpc_network = var.vpc_network
}

module "postgresql" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "5.1.1"

  project_id       = var.project_id
  region           = var.sql_region
  zone             = var.sql_zone
  database_version = var.sql_database_version
  name             = format("%s-%s-%s", module.naming.id, var.sql_suffix, random_id.random.hex)
  tier             = var.sql_tier
  ip_configuration = var.sql_ip_configuration

  depends_on = [
    module.postgresql_private_service_access
  ]
}
