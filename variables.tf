# Naming
variable "entity" {
  type        = string
  description = "Company that owns the subscription or workload the resource belongs to."
}

variable "unit" {
  type        = string
  description = <<EOT
  Top-level division of your company that owns the subscription or workload the resource belongs to.
  In smaller organizations, this may represent a single corporate top-level organizational element.
  (IT, Cloud & DevOps, Digital Factory, Management Consulting, T&M National, T&M International, ...)
  EOT
}

variable "projectappservice" {
  type        = string
  description = "Name of the project, application, workload, or service that the resource is a part of."
}

variable "environment" {
  type        = string
  description = "The stage of the workload's development lifecycle that the resource is supporting."
}

# Global
variable "project_id" {
  description = "GCP Project id"
  type        = string
}

variable "vpc_network" {
  type        = string
  description = "The VPC network to host the infrastructure in (required)"
}
