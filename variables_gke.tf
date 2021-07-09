# GKE
variable "gke_suffix" {
  type        = string
  description = "The suffix to be appended to the full cluster name (required)"
}

variable "gke_region" {
  type        = string
  description = "The region to host the cluster in (optional if zonal cluster / required if regional)"
  default     = null
}

variable "gke_network_project_id" {
  type        = string
  description = "The project ID of the shared VPC's host (for shared vpc support)"
  default     = ""
}

variable "gke_subnetwork" {
  type        = string
  description = "The subnetwork to host the cluster in (required)"
}

variable "gke_enable_vertical_pod_autoscaling" {
  type        = bool
  description = "Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it"
  default     = false
}

variable "gke_horizontal_pod_autoscaling" {
  type        = bool
  description = "Enable horizontal pod autoscaling addon"
  default     = true
}

variable "gke_http_load_balancing" {
  type        = bool
  description = "Enable httpload balancer addon"
  default     = true
}

variable "gke_network_policy" {
  type        = bool
  description = "Enable network policy addon"
  default     = false
}

variable "gke_network_policy_provider" {
  type        = string
  description = "The network policy provider."
  default     = "CALICO"
}

variable "gke_maintenance_start_time" {
  type        = string
  description = "Time window specified for daily or recurring maintenance operations in RFC3339 format"
  default     = "05:00"
}

variable "gke_maintenance_exclusions" {
  type        = list(object({ name = string, start_time = string, end_time = string }))
  description = "List of maintenance exclusions. A cluster can have up to three"
  default     = []
}


variable "gke_ip_range_pods" {
  type        = string
  description = "The _name_ of the secondary subnet ip range to use for pods"
}

variable "gke_ip_range_services" {
  type        = string
  description = "The _name_ of the secondary subnet range to use for services"
}

variable "gke_initial_node_count" {
  type        = number
  description = "The number of nodes to create in this cluster's default node pool."
  default     = 0
}

variable "gke_remove_default_node_pool" {
  type        = bool
  description = "Remove default node pool while setting up the cluster"
  default     = false
}

variable "gke_disable_legacy_metadata_endpoints" {
  type        = bool
  description = "Disable the /0.1/ and /v1beta1/ metadata server endpoints on the node. Changing this value will cause all node pools to be recreated."
  default     = true
}

variable "gke_node_pools" {
  type        = list(map(string))
  description = "List of maps containing node pools"

  default = [
    {
      name = "default-node-pool"
    },
  ]
}

variable "gke_node_pools_labels" {
  type        = map(map(string))
  description = "Map of maps containing node labels by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = {}
    default-node-pool = {}
  }
}

variable "gke_node_pools_metadata" {
  type        = map(map(string))
  description = "Map of maps containing node metadata by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = {}
    default-node-pool = {}
  }
}

variable "gke_resource_usage_export_dataset_id" {
  type        = string
  description = "The ID of a BigQuery Dataset for using BigQuery as the destination of resource usage export."
  default     = ""
}

variable "gke_enable_network_egress_export" {
  type        = bool
  description = "Whether to enable network egress metering for this cluster. If enabled, a daemonset will be created in the cluster to meter network egress traffic."
  default     = false
}

variable "gke_enable_resource_consumption_export" {
  type        = bool
  description = "Whether to enable resource consumption metering on this cluster. When enabled, a table will be created in the resource export BigQuery dataset to store resource consumption data. The resulting table can be joined with the resource usage table or with BigQuery billing export."
  default     = true
}

variable "gke_cluster_autoscaling" {
  type = object({
    enabled       = bool
    min_cpu_cores = number
    max_cpu_cores = number
    min_memory_gb = number
    max_memory_gb = number
  })
  default = {
    enabled       = false
    max_cpu_cores = 0
    min_cpu_cores = 0
    max_memory_gb = 0
    min_memory_gb = 0
  }
  description = "Cluster autoscaling configuration. See [more details](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#clusterautoscaling)"
}

variable "gke_node_pools_taints" {
  type        = map(list(object({ key = string, value = string, effect = string })))
  description = "Map of lists containing node taints by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = []
    default-node-pool = []
  }
}

variable "gke_node_pools_tags" {
  type        = map(list(string))
  description = "Map of lists containing node network tags by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = []
    default-node-pool = []
  }
}

variable "gke_node_pools_oauth_scopes" {
  type        = map(list(string))
  description = "Map of lists containing node oauth scopes by node-pool name"

  # Default is being set in variables_defaults.tf
  default = {
    all               = ["https://www.googleapis.com/auth/cloud-platform"]
    default-node-pool = []
  }
}

variable "gke_stub_domains" {
  type        = map(list(string))
  description = "Map of stub domains and their resolvers to forward DNS queries for a certain domain to an external DNS server"
  default     = {}
}

variable "gke_upstream_nameservers" {
  type        = list(string)
  description = "If specified, the values replace the nameservers taken by default from the node’s /etc/resolv.conf"
  default     = []
}

variable "gke_non_masquerade_cidrs" {
  type        = list(string)
  description = "List of strings in CIDR notation that specify the IP address ranges that do not use IP masquerading."
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

variable "gke_ip_masq_resync_interval" {
  type        = string
  description = "The interval at which the agent attempts to sync its ConfigMap file from the disk."
  default     = "60s"
}

variable "gke_ip_masq_link_local" {
  type        = bool
  description = "Whether to masquerade traffic to the link-local prefix (169.254.0.0/16)."
  default     = false
}

variable "gke_configure_ip_masq" {
  description = "Enables the installation of ip masquerading, which is usually no longer required when using aliasied IP addresses. IP masquerading uses a kubectl call, so when you have a private cluster, you will need access to the API server."
  default     = false
}

variable "gke_logging_service" {
  type        = string
  description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none"
  default     = "logging.googleapis.com/kubernetes"
}

variable "gke_monitoring_service" {
  type        = string
  description = "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none"
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "gke_grant_registry_access" {
  type        = bool
  description = "Grants created cluster-specific service account storage.objectViewer role."
  default     = false
}

variable "gke_registry_project_ids" {
  type        = list(string)
  description = "Projects holding Google Container Registries. If empty, we use the cluster project. If a service account is created and the `grant_registry_access` variable is set to `true`, the `storage.objectViewer` role is assigned on these projects."
  default     = []
}

variable "gke_basic_auth_username" {
  type        = string
  description = "The username to be used with Basic Authentication. An empty value will disable Basic Authentication, which is the recommended configuration."
  default     = ""
}

variable "gke_basic_auth_password" {
  type        = string
  description = "The password to be used with Basic Authentication."
  default     = ""
}

variable "gke_issue_client_certificate" {
  type        = bool
  description = "Issues a client certificate to authenticate to the cluster endpoint. To maximize the security of your cluster, leave this option disabled. Client certificates don't automatically rotate and aren't easily revocable. WARNING: changing this after cluster creation is destructive!"
  default     = false
}

variable "gke_cluster_ipv4_cidr" {
  default     = null
  description = "The IP address range of the kubernetes pods in this cluster. Default is an automatically assigned CIDR."
}

variable "gke_cluster_resource_labels" {
  type        = map(string)
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster"
  default     = {}
}

variable "gke_default_max_pods_per_node" {
  description = "The maximum number of pods to schedule per node"
  default     = 110
}

variable "gke_node_metadata" {
  description = "Specifies how node metadata is exposed to the workload running on the node"
  default     = "GKE_METADATA_SERVER"
  type        = string
}

variable "gke_database_encryption" {
  description = "Application-layer Secrets Encryption settings. The object format is {state = string, key_name = string}. Valid values of state are: \"ENCRYPTED\"; \"DECRYPTED\". key_name is the name of a CloudKMS key."
  type        = list(object({ state = string, key_name = string }))

  default = [{
    state    = "DECRYPTED"
    key_name = ""
  }]
}

variable "gke_identity_namespace" {
  description = "Workload Identity namespace. (Default value of `enabled` automatically sets project based namespace `[project_id].svc.id.goog`)"
  type        = string
  default     = "enabled"
}

variable "gke_release_channel" {
  type        = string
  description = "The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `UNSPECIFIED`."
  default     = null
}

variable "gke_enable_shielded_nodes" {
  type        = bool
  description = "Enable Shielded Nodes features on all nodes in this cluster"
  default     = true
}

variable "gke_add_cluster_firewall_rules" {
  type        = bool
  description = "Create additional firewall rules"
  default     = false
}

variable "gke_add_master_webhook_firewall_rules" {
  type        = bool
  description = "Create master_webhook firewall rules for ports defined in `firewall_inbound_ports`"
  default     = false
}

variable "gke_firewall_priority" {
  type        = number
  description = "Priority rule for firewall rules"
  default     = 1000
}

variable "gke_firewall_inbound_ports" {
  type        = list(string)
  description = "List of TCP ports for admission/webhook controllers. Either flag `add_master_webhook_firewall_rules` or `add_cluster_firewall_rules` (also adds egress rules) must be set to `true` for inbound-ports firewall rules to be applied."
  default     = ["8443", "9443", "15017"]
}

variable "gke_gcloud_upgrade" {
  type        = bool
  description = "Whether to upgrade gcloud at runtime"
  default     = false
}

variable "gke_add_shadow_firewall_rules" {
  type        = bool
  description = "Create GKE shadow firewall (the same as default firewall rules with firewall logs enabled)."
  default     = false
}

variable "gke_shadow_firewall_rules_priority" {
  type        = number
  description = "The firewall priority of GKE shadow firewall rules. The priority should be less than default firewall, which is 1000."
  default     = 999
}

variable "gke_impersonate_service_account" {
  type        = string
  description = "An optional service account to impersonate for gcloud commands. If this service account is not specified, the module will use Application Default Credentials."
  default     = ""
}

variable "gke_deploy_using_private_endpoint" {
  type        = bool
  description = "(Beta) A toggle for Terraform and kubectl to connect to the master's internal IP address during deployment."
  default     = false
}

variable "gke_enable_private_nodes" {
  type        = bool
  description = "(Beta) Whether nodes have internal IP addresses only"
  default     = false
}

variable "gke_master_ipv4_cidr_block" {
  type        = string
  description = "(Beta) The IP range in CIDR notation to use for the hosted master network"
  default     = "10.0.0.0/28"
}

variable "gke_asm_enable_all" {
  description = "Sets `--enable_all` option if true."
  type        = bool
  default     = false
}
