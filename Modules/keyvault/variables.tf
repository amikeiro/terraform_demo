variable "region" {
    description = "Name of region"
    type = string
}

variable "project" {
    description = "Name of the project"
    type = string  
}

variable "environment" {
    description = "Name of the environment"
    type = string  
}

variable "tenant_id" {
    description = "Tenant ID for deployment"
    type = string
  
}

variable "resource_group_name" {
    description = "Name of resource group"
    type = string
}

variable "tags" {
    description = "Tags for the resource"
    type = map(string)
}

variable "allowed_subnets" {
    description = "List of subnets allowed for network_acls"
    type = list(string)
}

variable "allowed_ips" {
    description = "List of ips allowed for network_acls"
    type = list(string)
}

variable "object" {
    description = "Object ID for access configuration"
    type = string
}