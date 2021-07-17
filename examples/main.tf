module "mpro" {
  source            = "../"
  entity            = "bold"
  unit              = "cd"
  projectappservice = "mpro"
  environment       = "sandbox"
  project_id        = "bold-cd-playground-oscar"
  vpc_network       = "bold-cd-playground-oscar-vpc1"
  # GKE
  gke_region                 = "europe-west1"
  gke_release_channel        = "UNSPECIFIED"
  gke_enable_private_nodes   = true
  gke_kubernetes_version     = "1.19"
  gke_regional               = false
  gke_suffix                 = "gke"
  gke_subnetwork             = "bold-cd-playground-oscar-vpc1-gke1"
  gke_ip_range_pods          = "bold-cd-playground-oscar-vpc1-gke1-pods"
  gke_ip_range_services      = "bold-cd-playground-oscar-vpc1-gke1-services"
  gke_create_service_account = false
  gke_master_authorized_networks = [
    {
      cidr_block   = "10.128.0.0/17"
      display_name = "VPC range"
    }
  ]
  gke_zones                             = ["europe-west1-b"]
  gke_add_master_webhook_firewall_rules = true
  gke_firewall_inbound_ports            = ["15017", "443", "8443", "9443", ]
  # Cloud SQL
  sql_suffix           = "sql"
  sql_database_version = "POSTGRES_12"
  sql_region           = "europe-west1"
  sql_zone             = "europe-west1-b"
  sql_tier             = "db-g1-small"
  sql_ip_configuration = {
    ipv4_enabled        = false # This flag pertains to Public IP
    require_ssl         = true
    private_network     = "projects/bold-cd-playground-oscar/global/networks/bold-cd-playground-oscar-vpc1"
    authorized_networks = []
  }
}
