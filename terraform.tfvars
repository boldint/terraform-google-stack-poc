entity            = "bold"
unit              = "cd"
projectappservice = "mpro"
environment       = "sandbox"
project_id = "bold-cd-playground-antonio"
vpc_network = "mysubnet01"

# GKE
gke_cluster_ipv4_cidr = null
gke_region          = "europe-west1"
gke_release_channel = "REGULAR"
gke_enable_private_nodes = true
gke_suffix = "gke"
gke_subnetwork = "mysubnet01"
gke_ip_range_pods = "my-range-pods"
gke_ip_range_services = "my-range-services"
gke_http_load_balancing = false
gke_horizontal_pod_autoscaling = false
gke_network_policy             = false
gke_master_ipv4_cidr_block     = "10.0.0.0/28"
gke_default_max_pods_per_node   = 55
gke_add_master_webhook_firewall_rules = true
gke_firewall_inbound_ports = ["10250", "443", "15017"]
gke_node_pools = [
    {
      name                      = "my-node-pool"
      machine_type              = "e2-standard-4"
      node_locations            = "europe-west1-b"
      min_count                 = 3
      max_count                 = 3
      local_ssd_count           = 0
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "COS"
      preemptible               = false
      initial_node_count        = 3
    },
  ]

# ASM
asm_enable_all = true

# Cloud SQL
sql_suffix = "sql"
sql_database_version = "POSTGRES_12"
sql_region = "europe-west1"
sql_zone = "europe-west1-b"
sql_tier = "db-g1-small"
sql_ip_configuration = {
  ipv4_enabled    = false # This flag pertains to Public IP
  require_ssl     = true
  private_network = "projects/bold-cd-playground-antonio/global/networks/mysubnet01"
  authorized_networks = []
}
