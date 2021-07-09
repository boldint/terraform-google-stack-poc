# GCP Infra POC

[//]: # (Do not make changes below this line)
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asm-gke"></a> [asm-gke](#module\_asm-gke) | terraform-google-modules/kubernetes-engine/google//modules/asm | 15.0.1 |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/private-cluster | 15.0.1 |
| <a name="module_naming"></a> [naming](#module\_naming) | cloudposse/label/null | 0.24.1 |
| <a name="module_postgresql"></a> [postgresql](#module\_postgresql) | GoogleCloudPlatform/sql-db/google//modules/postgresql | 5.1.1 |
| <a name="module_postgresql_private_service_access"></a> [postgresql\_private\_service\_access](#module\_postgresql\_private\_service\_access) | GoogleCloudPlatform/sql-db/google//modules/private_service_access | 5.1.1 |

## Resources

| Name | Type |
|------|------|
| [random_id.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asm_enable_all"></a> [asm\_enable\_all](#input\_asm\_enable\_all) | Sets `--enable_all` option if true. | `bool` | `false` | no |
| <a name="input_entity"></a> [entity](#input\_entity) | Company that owns the subscription or workload the resource belongs to. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The stage of the workload's development lifecycle that the resource is supporting. | `string` | n/a | yes |
| <a name="input_gke_add_cluster_firewall_rules"></a> [gke\_add\_cluster\_firewall\_rules](#input\_gke\_add\_cluster\_firewall\_rules) | Create additional firewall rules | `bool` | `false` | no |
| <a name="input_gke_add_master_webhook_firewall_rules"></a> [gke\_add\_master\_webhook\_firewall\_rules](#input\_gke\_add\_master\_webhook\_firewall\_rules) | Create master\_webhook firewall rules for ports defined in `firewall_inbound_ports` | `bool` | `false` | no |
| <a name="input_gke_add_shadow_firewall_rules"></a> [gke\_add\_shadow\_firewall\_rules](#input\_gke\_add\_shadow\_firewall\_rules) | Create GKE shadow firewall (the same as default firewall rules with firewall logs enabled). | `bool` | `false` | no |
| <a name="input_gke_asm_enable_all"></a> [gke\_asm\_enable\_all](#input\_gke\_asm\_enable\_all) | Sets `--enable_all` option if true. | `bool` | `false` | no |
| <a name="input_gke_basic_auth_password"></a> [gke\_basic\_auth\_password](#input\_gke\_basic\_auth\_password) | The password to be used with Basic Authentication. | `string` | `""` | no |
| <a name="input_gke_basic_auth_username"></a> [gke\_basic\_auth\_username](#input\_gke\_basic\_auth\_username) | The username to be used with Basic Authentication. An empty value will disable Basic Authentication, which is the recommended configuration. | `string` | `""` | no |
| <a name="input_gke_cluster_autoscaling"></a> [gke\_cluster\_autoscaling](#input\_gke\_cluster\_autoscaling) | Cluster autoscaling configuration. See [more details](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#clusterautoscaling) | <pre>object({<br>    enabled       = bool<br>    min_cpu_cores = number<br>    max_cpu_cores = number<br>    min_memory_gb = number<br>    max_memory_gb = number<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "max_cpu_cores": 0,<br>  "max_memory_gb": 0,<br>  "min_cpu_cores": 0,<br>  "min_memory_gb": 0<br>}</pre> | no |
| <a name="input_gke_cluster_ipv4_cidr"></a> [gke\_cluster\_ipv4\_cidr](#input\_gke\_cluster\_ipv4\_cidr) | The IP address range of the kubernetes pods in this cluster. Default is an automatically assigned CIDR. | `any` | `null` | no |
| <a name="input_gke_cluster_resource_labels"></a> [gke\_cluster\_resource\_labels](#input\_gke\_cluster\_resource\_labels) | The GCE resource labels (a map of key/value pairs) to be applied to the cluster | `map(string)` | `{}` | no |
| <a name="input_gke_configure_ip_masq"></a> [gke\_configure\_ip\_masq](#input\_gke\_configure\_ip\_masq) | Enables the installation of ip masquerading, which is usually no longer required when using aliasied IP addresses. IP masquerading uses a kubectl call, so when you have a private cluster, you will need access to the API server. | `bool` | `false` | no |
| <a name="input_gke_database_encryption"></a> [gke\_database\_encryption](#input\_gke\_database\_encryption) | Application-layer Secrets Encryption settings. The object format is {state = string, key\_name = string}. Valid values of state are: "ENCRYPTED"; "DECRYPTED". key\_name is the name of a CloudKMS key. | `list(object({ state = string, key_name = string }))` | <pre>[<br>  {<br>    "key_name": "",<br>    "state": "DECRYPTED"<br>  }<br>]</pre> | no |
| <a name="input_gke_default_max_pods_per_node"></a> [gke\_default\_max\_pods\_per\_node](#input\_gke\_default\_max\_pods\_per\_node) | The maximum number of pods to schedule per node | `number` | `110` | no |
| <a name="input_gke_deploy_using_private_endpoint"></a> [gke\_deploy\_using\_private\_endpoint](#input\_gke\_deploy\_using\_private\_endpoint) | (Beta) A toggle for Terraform and kubectl to connect to the master's internal IP address during deployment. | `bool` | `false` | no |
| <a name="input_gke_disable_legacy_metadata_endpoints"></a> [gke\_disable\_legacy\_metadata\_endpoints](#input\_gke\_disable\_legacy\_metadata\_endpoints) | Disable the /0.1/ and /v1beta1/ metadata server endpoints on the node. Changing this value will cause all node pools to be recreated. | `bool` | `true` | no |
| <a name="input_gke_enable_network_egress_export"></a> [gke\_enable\_network\_egress\_export](#input\_gke\_enable\_network\_egress\_export) | Whether to enable network egress metering for this cluster. If enabled, a daemonset will be created in the cluster to meter network egress traffic. | `bool` | `false` | no |
| <a name="input_gke_enable_private_nodes"></a> [gke\_enable\_private\_nodes](#input\_gke\_enable\_private\_nodes) | (Beta) Whether nodes have internal IP addresses only | `bool` | `false` | no |
| <a name="input_gke_enable_resource_consumption_export"></a> [gke\_enable\_resource\_consumption\_export](#input\_gke\_enable\_resource\_consumption\_export) | Whether to enable resource consumption metering on this cluster. When enabled, a table will be created in the resource export BigQuery dataset to store resource consumption data. The resulting table can be joined with the resource usage table or with BigQuery billing export. | `bool` | `true` | no |
| <a name="input_gke_enable_shielded_nodes"></a> [gke\_enable\_shielded\_nodes](#input\_gke\_enable\_shielded\_nodes) | Enable Shielded Nodes features on all nodes in this cluster | `bool` | `true` | no |
| <a name="input_gke_enable_vertical_pod_autoscaling"></a> [gke\_enable\_vertical\_pod\_autoscaling](#input\_gke\_enable\_vertical\_pod\_autoscaling) | Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it | `bool` | `false` | no |
| <a name="input_gke_firewall_inbound_ports"></a> [gke\_firewall\_inbound\_ports](#input\_gke\_firewall\_inbound\_ports) | List of TCP ports for admission/webhook controllers. Either flag `add_master_webhook_firewall_rules` or `add_cluster_firewall_rules` (also adds egress rules) must be set to `true` for inbound-ports firewall rules to be applied. | `list(string)` | <pre>[<br>  "8443",<br>  "9443",<br>  "15017"<br>]</pre> | no |
| <a name="input_gke_firewall_priority"></a> [gke\_firewall\_priority](#input\_gke\_firewall\_priority) | Priority rule for firewall rules | `number` | `1000` | no |
| <a name="input_gke_gcloud_upgrade"></a> [gke\_gcloud\_upgrade](#input\_gke\_gcloud\_upgrade) | Whether to upgrade gcloud at runtime | `bool` | `false` | no |
| <a name="input_gke_grant_registry_access"></a> [gke\_grant\_registry\_access](#input\_gke\_grant\_registry\_access) | Grants created cluster-specific service account storage.objectViewer role. | `bool` | `false` | no |
| <a name="input_gke_horizontal_pod_autoscaling"></a> [gke\_horizontal\_pod\_autoscaling](#input\_gke\_horizontal\_pod\_autoscaling) | Enable horizontal pod autoscaling addon | `bool` | `true` | no |
| <a name="input_gke_http_load_balancing"></a> [gke\_http\_load\_balancing](#input\_gke\_http\_load\_balancing) | Enable httpload balancer addon | `bool` | `true` | no |
| <a name="input_gke_identity_namespace"></a> [gke\_identity\_namespace](#input\_gke\_identity\_namespace) | Workload Identity namespace. (Default value of `enabled` automatically sets project based namespace `[project_id].svc.id.goog`) | `string` | `"enabled"` | no |
| <a name="input_gke_impersonate_service_account"></a> [gke\_impersonate\_service\_account](#input\_gke\_impersonate\_service\_account) | An optional service account to impersonate for gcloud commands. If this service account is not specified, the module will use Application Default Credentials. | `string` | `""` | no |
| <a name="input_gke_initial_node_count"></a> [gke\_initial\_node\_count](#input\_gke\_initial\_node\_count) | The number of nodes to create in this cluster's default node pool. | `number` | `0` | no |
| <a name="input_gke_ip_masq_link_local"></a> [gke\_ip\_masq\_link\_local](#input\_gke\_ip\_masq\_link\_local) | Whether to masquerade traffic to the link-local prefix (169.254.0.0/16). | `bool` | `false` | no |
| <a name="input_gke_ip_masq_resync_interval"></a> [gke\_ip\_masq\_resync\_interval](#input\_gke\_ip\_masq\_resync\_interval) | The interval at which the agent attempts to sync its ConfigMap file from the disk. | `string` | `"60s"` | no |
| <a name="input_gke_ip_range_pods"></a> [gke\_ip\_range\_pods](#input\_gke\_ip\_range\_pods) | The _name_ of the secondary subnet ip range to use for pods | `string` | n/a | yes |
| <a name="input_gke_ip_range_services"></a> [gke\_ip\_range\_services](#input\_gke\_ip\_range\_services) | The _name_ of the secondary subnet range to use for services | `string` | n/a | yes |
| <a name="input_gke_issue_client_certificate"></a> [gke\_issue\_client\_certificate](#input\_gke\_issue\_client\_certificate) | Issues a client certificate to authenticate to the cluster endpoint. To maximize the security of your cluster, leave this option disabled. Client certificates don't automatically rotate and aren't easily revocable. WARNING: changing this after cluster creation is destructive! | `bool` | `false` | no |
| <a name="input_gke_logging_service"></a> [gke\_logging\_service](#input\_gke\_logging\_service) | The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none | `string` | `"logging.googleapis.com/kubernetes"` | no |
| <a name="input_gke_maintenance_exclusions"></a> [gke\_maintenance\_exclusions](#input\_gke\_maintenance\_exclusions) | List of maintenance exclusions. A cluster can have up to three | `list(object({ name = string, start_time = string, end_time = string }))` | `[]` | no |
| <a name="input_gke_maintenance_start_time"></a> [gke\_maintenance\_start\_time](#input\_gke\_maintenance\_start\_time) | Time window specified for daily or recurring maintenance operations in RFC3339 format | `string` | `"05:00"` | no |
| <a name="input_gke_master_authorized_networks"></a> [gke\_master\_authorized\_networks](#input\_gke\_master\_authorized\_networks) | List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists). | `list(object({ cidr_block = string, display_name = string }))` | `[]` | no |
| <a name="input_gke_master_ipv4_cidr_block"></a> [gke\_master\_ipv4\_cidr\_block](#input\_gke\_master\_ipv4\_cidr\_block) | (Beta) The IP range in CIDR notation to use for the hosted master network | `string` | `"10.0.0.0/28"` | no |
| <a name="input_gke_monitoring_service"></a> [gke\_monitoring\_service](#input\_gke\_monitoring\_service) | The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| <a name="input_gke_network_policy"></a> [gke\_network\_policy](#input\_gke\_network\_policy) | Enable network policy addon | `bool` | `false` | no |
| <a name="input_gke_network_policy_provider"></a> [gke\_network\_policy\_provider](#input\_gke\_network\_policy\_provider) | The network policy provider. | `string` | `"CALICO"` | no |
| <a name="input_gke_network_project_id"></a> [gke\_network\_project\_id](#input\_gke\_network\_project\_id) | The project ID of the shared VPC's host (for shared vpc support) | `string` | `""` | no |
| <a name="input_gke_node_metadata"></a> [gke\_node\_metadata](#input\_gke\_node\_metadata) | Specifies how node metadata is exposed to the workload running on the node | `string` | `"GKE_METADATA_SERVER"` | no |
| <a name="input_gke_node_pools"></a> [gke\_node\_pools](#input\_gke\_node\_pools) | List of maps containing node pools | `list(map(string))` | <pre>[<br>  {<br>    "name": "default-node-pool"<br>  }<br>]</pre> | no |
| <a name="input_gke_node_pools_labels"></a> [gke\_node\_pools\_labels](#input\_gke\_node\_pools\_labels) | Map of maps containing node labels by node-pool name | `map(map(string))` | <pre>{<br>  "all": {},<br>  "default-node-pool": {}<br>}</pre> | no |
| <a name="input_gke_node_pools_metadata"></a> [gke\_node\_pools\_metadata](#input\_gke\_node\_pools\_metadata) | Map of maps containing node metadata by node-pool name | `map(map(string))` | <pre>{<br>  "all": {},<br>  "default-node-pool": {}<br>}</pre> | no |
| <a name="input_gke_node_pools_oauth_scopes"></a> [gke\_node\_pools\_oauth\_scopes](#input\_gke\_node\_pools\_oauth\_scopes) | Map of lists containing node oauth scopes by node-pool name | `map(list(string))` | <pre>{<br>  "all": [<br>    "https://www.googleapis.com/auth/cloud-platform"<br>  ],<br>  "default-node-pool": []<br>}</pre> | no |
| <a name="input_gke_node_pools_tags"></a> [gke\_node\_pools\_tags](#input\_gke\_node\_pools\_tags) | Map of lists containing node network tags by node-pool name | `map(list(string))` | <pre>{<br>  "all": [],<br>  "default-node-pool": []<br>}</pre> | no |
| <a name="input_gke_node_pools_taints"></a> [gke\_node\_pools\_taints](#input\_gke\_node\_pools\_taints) | Map of lists containing node taints by node-pool name | `map(list(object({ key = string, value = string, effect = string })))` | <pre>{<br>  "all": [],<br>  "default-node-pool": []<br>}</pre> | no |
| <a name="input_gke_non_masquerade_cidrs"></a> [gke\_non\_masquerade\_cidrs](#input\_gke\_non\_masquerade\_cidrs) | List of strings in CIDR notation that specify the IP address ranges that do not use IP masquerading. | `list(string)` | <pre>[<br>  "10.0.0.0/8",<br>  "172.16.0.0/12",<br>  "192.168.0.0/16"<br>]</pre> | no |
| <a name="input_gke_region"></a> [gke\_region](#input\_gke\_region) | The region to host the cluster in (optional if zonal cluster / required if regional) | `string` | `null` | no |
| <a name="input_gke_registry_project_ids"></a> [gke\_registry\_project\_ids](#input\_gke\_registry\_project\_ids) | Projects holding Google Container Registries. If empty, we use the cluster project. If a service account is created and the `grant_registry_access` variable is set to `true`, the `storage.objectViewer` role is assigned on these projects. | `list(string)` | `[]` | no |
| <a name="input_gke_release_channel"></a> [gke\_release\_channel](#input\_gke\_release\_channel) | The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `UNSPECIFIED`. | `string` | `null` | no |
| <a name="input_gke_remove_default_node_pool"></a> [gke\_remove\_default\_node\_pool](#input\_gke\_remove\_default\_node\_pool) | Remove default node pool while setting up the cluster | `bool` | `false` | no |
| <a name="input_gke_resource_usage_export_dataset_id"></a> [gke\_resource\_usage\_export\_dataset\_id](#input\_gke\_resource\_usage\_export\_dataset\_id) | The ID of a BigQuery Dataset for using BigQuery as the destination of resource usage export. | `string` | `""` | no |
| <a name="input_gke_shadow_firewall_rules_priority"></a> [gke\_shadow\_firewall\_rules\_priority](#input\_gke\_shadow\_firewall\_rules\_priority) | The firewall priority of GKE shadow firewall rules. The priority should be less than default firewall, which is 1000. | `number` | `999` | no |
| <a name="input_gke_stub_domains"></a> [gke\_stub\_domains](#input\_gke\_stub\_domains) | Map of stub domains and their resolvers to forward DNS queries for a certain domain to an external DNS server | `map(list(string))` | `{}` | no |
| <a name="input_gke_subnetwork"></a> [gke\_subnetwork](#input\_gke\_subnetwork) | The subnetwork to host the cluster in (required) | `string` | n/a | yes |
| <a name="input_gke_suffix"></a> [gke\_suffix](#input\_gke\_suffix) | The suffix to be appended to the full cluster name (required) | `string` | n/a | yes |
| <a name="input_gke_upstream_nameservers"></a> [gke\_upstream\_nameservers](#input\_gke\_upstream\_nameservers) | If specified, the values replace the nameservers taken by default from the node’s /etc/resolv.conf | `list(string)` | `[]` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP Project id | `string` | n/a | yes |
| <a name="input_projectappservice"></a> [projectappservice](#input\_projectappservice) | Name of the project, application, workload, or service that the resource is a part of. | `string` | n/a | yes |
| <a name="input_sql_activation_policy"></a> [sql\_activation\_policy](#input\_sql\_activation\_policy) | The activation policy for the master instance.Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. | `string` | `"ALWAYS"` | no |
| <a name="input_sql_additional_databases"></a> [sql\_additional\_databases](#input\_sql\_additional\_databases) | A list of databases to be created in your cluster | <pre>list(object({<br>    name      = string<br>    charset   = string<br>    collation = string<br>  }))</pre> | `[]` | no |
| <a name="input_sql_additional_users"></a> [sql\_additional\_users](#input\_sql\_additional\_users) | A list of users to be created in your cluster | <pre>list(object({<br>    name     = string<br>    password = string<br>  }))</pre> | `[]` | no |
| <a name="input_sql_availability_type"></a> [sql\_availability\_type](#input\_sql\_availability\_type) | The availability type for the master instance.This is only used to set up high availability for the PostgreSQL instance. Can be either `ZONAL` or `REGIONAL`. | `string` | `"ZONAL"` | no |
| <a name="input_sql_backup_configuration"></a> [sql\_backup\_configuration](#input\_sql\_backup\_configuration) | The backup\_configuration settings subblock for the database setings | <pre>object({<br>    enabled                        = bool<br>    start_time                     = string<br>    location                       = string<br>    point_in_time_recovery_enabled = bool<br>    transaction_log_retention_days = string<br>    retained_backups               = number<br>    retention_unit                 = string<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "location": null,<br>  "point_in_time_recovery_enabled": false,<br>  "retained_backups": null,<br>  "retention_unit": null,<br>  "start_time": null,<br>  "transaction_log_retention_days": null<br>}</pre> | no |
| <a name="input_sql_create_timeout"></a> [sql\_create\_timeout](#input\_sql\_create\_timeout) | The optional timout that is applied to limit long database creates. | `string` | `"15m"` | no |
| <a name="input_sql_database_flags"></a> [sql\_database\_flags](#input\_sql\_database\_flags) | The database flags for the master instance. See [more details](https://cloud.google.com/sql/docs/postgres/flags) | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_sql_database_version"></a> [sql\_database\_version](#input\_sql\_database\_version) | The database version to use | `string` | n/a | yes |
| <a name="input_sql_db_charset"></a> [sql\_db\_charset](#input\_sql\_db\_charset) | The charset for the default database | `string` | `""` | no |
| <a name="input_sql_db_collation"></a> [sql\_db\_collation](#input\_sql\_db\_collation) | The collation for the default database. Example: 'en\_US.UTF8' | `string` | `""` | no |
| <a name="input_sql_db_name"></a> [sql\_db\_name](#input\_sql\_db\_name) | The name of the default database to create | `string` | `"default"` | no |
| <a name="input_sql_delete_timeout"></a> [sql\_delete\_timeout](#input\_sql\_delete\_timeout) | The optional timout that is applied to limit long database deletes. | `string` | `"15m"` | no |
| <a name="input_sql_deletion_protection"></a> [sql\_deletion\_protection](#input\_sql\_deletion\_protection) | Used to block Terraform from deleting a SQL Instance. | `bool` | `true` | no |
| <a name="input_sql_disk_autoresize"></a> [sql\_disk\_autoresize](#input\_sql\_disk\_autoresize) | Configuration to increase storage size. | `bool` | `true` | no |
| <a name="input_sql_disk_size"></a> [sql\_disk\_size](#input\_sql\_disk\_size) | The disk size for the master instance. | `number` | `10` | no |
| <a name="input_sql_disk_type"></a> [sql\_disk\_type](#input\_sql\_disk\_type) | The disk type for the master instance. | `string` | `"PD_SSD"` | no |
| <a name="input_sql_enable_default_db"></a> [sql\_enable\_default\_db](#input\_sql\_enable\_default\_db) | Enable or disable the creation of the default database | `bool` | `true` | no |
| <a name="input_sql_enable_default_user"></a> [sql\_enable\_default\_user](#input\_sql\_enable\_default\_user) | Enable or disable the creation of the default user | `bool` | `true` | no |
| <a name="input_sql_encryption_key_name"></a> [sql\_encryption\_key\_name](#input\_sql\_encryption\_key\_name) | The full path to the encryption key used for the CMEK disk encryption | `string` | `null` | no |
| <a name="input_sql_iam_user_emails"></a> [sql\_iam\_user\_emails](#input\_sql\_iam\_user\_emails) | A list of IAM users to be created in your cluster | `list(string)` | `[]` | no |
| <a name="input_sql_insights_config"></a> [sql\_insights\_config](#input\_sql\_insights\_config) | The insights\_config settings for the database. | <pre>object({<br>    query_string_length     = number<br>    record_application_tags = bool<br>    record_client_address   = bool<br>  })</pre> | `null` | no |
| <a name="input_sql_ip_configuration"></a> [sql\_ip\_configuration](#input\_sql\_ip\_configuration) | The ip configuration for the master instances. | <pre>object({<br>    authorized_networks = list(map(string))<br>    ipv4_enabled        = bool<br>    private_network     = string<br>    require_ssl         = bool<br>  })</pre> | <pre>{<br>  "authorized_networks": [],<br>  "ipv4_enabled": true,<br>  "private_network": null,<br>  "require_ssl": null<br>}</pre> | no |
| <a name="input_sql_maintenance_window_day"></a> [sql\_maintenance\_window\_day](#input\_sql\_maintenance\_window\_day) | The day of week (1-7) for the master instance maintenance. | `number` | `1` | no |
| <a name="input_sql_maintenance_window_hour"></a> [sql\_maintenance\_window\_hour](#input\_sql\_maintenance\_window\_hour) | The hour of day (0-23) maintenance window for the master instance maintenance. | `number` | `23` | no |
| <a name="input_sql_maintenance_window_update_track"></a> [sql\_maintenance\_window\_update\_track](#input\_sql\_maintenance\_window\_update\_track) | The update track of maintenance window for the master instance maintenance.Can be either `canary` or `stable`. | `string` | `"canary"` | no |
| <a name="input_sql_module_depends_on"></a> [sql\_module\_depends\_on](#input\_sql\_module\_depends\_on) | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| <a name="input_sql_pricing_plan"></a> [sql\_pricing\_plan](#input\_sql\_pricing\_plan) | The pricing plan for the master instance. | `string` | `"PER_USE"` | no |
| <a name="input_sql_random_instance_name"></a> [sql\_random\_instance\_name](#input\_sql\_random\_instance\_name) | Sets random suffix at the end of the Cloud SQL resource name | `bool` | `false` | no |
| <a name="input_sql_read_replica_deletion_protection"></a> [sql\_read\_replica\_deletion\_protection](#input\_sql\_read\_replica\_deletion\_protection) | Used to block Terraform from deleting replica SQL Instances. | `bool` | `false` | no |
| <a name="input_sql_read_replica_name_suffix"></a> [sql\_read\_replica\_name\_suffix](#input\_sql\_read\_replica\_name\_suffix) | The optional suffix to add to the read instance name | `string` | `""` | no |
| <a name="input_sql_read_replicas"></a> [sql\_read\_replicas](#input\_sql\_read\_replicas) | List of read replicas to create | <pre>list(object({<br>    name            = string<br>    tier            = string<br>    zone            = string<br>    disk_type       = string<br>    disk_autoresize = bool<br>    disk_size       = string<br>    user_labels     = map(string)<br>    database_flags = list(object({<br>      name  = string<br>      value = string<br>    }))<br>    ip_configuration = object({<br>      authorized_networks = list(map(string))<br>      ipv4_enabled        = bool<br>      private_network     = string<br>      require_ssl         = bool<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_sql_region"></a> [sql\_region](#input\_sql\_region) | The region of the Cloud SQL resources | `string` | `"us-central1"` | no |
| <a name="input_sql_suffix"></a> [sql\_suffix](#input\_sql\_suffix) | The suffix of the Cloud SQL resources | `string` | n/a | yes |
| <a name="input_sql_tier"></a> [sql\_tier](#input\_sql\_tier) | The tier for the master instance. | `string` | `"db-f1-micro"` | no |
| <a name="input_sql_update_timeout"></a> [sql\_update\_timeout](#input\_sql\_update\_timeout) | The optional timout that is applied to limit long database updates. | `string` | `"15m"` | no |
| <a name="input_sql_user_labels"></a> [sql\_user\_labels](#input\_sql\_user\_labels) | The key/value labels for the master instances. | `map(string)` | `{}` | no |
| <a name="input_sql_user_name"></a> [sql\_user\_name](#input\_sql\_user\_name) | The name of the default user | `string` | `"default"` | no |
| <a name="input_sql_user_password"></a> [sql\_user\_password](#input\_sql\_user\_password) | The password for the default user. If not set, a random one will be generated and available in the generated\_user\_password output variable. | `string` | `""` | no |
| <a name="input_sql_zone"></a> [sql\_zone](#input\_sql\_zone) | The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`. | `string` | n/a | yes |
| <a name="input_unit"></a> [unit](#input\_unit) | Top-level division of your company that owns the subscription or workload the resource belongs to.<br>  In smaller organizations, this may represent a single corporate top-level organizational element.<br>  (IT, Cloud & DevOps, Digital Factory, Management Consulting, T&M National, T&M International, ...) | `string` | n/a | yes |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | The VPC network to host the infrastructure in (required) | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
