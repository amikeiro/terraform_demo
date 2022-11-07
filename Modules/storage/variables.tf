variable "account_name" {
    description = "The name of the storage account"
    type = string
}

variable "resource_group_name" {
    description = "Name of target resource group"
    type = string
}

variable "region" {
    description = "Region in which to deploy the resource"
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

variable "log_analytics_workspace_id" {
    description = "ID of the log analytics workspace to send the logs to"
}

variable "allowed_subnets" {
    description = "Subnet in which to deploy private endpoints"
    type = list(string)
}

variable "allowed_ips" {
    description = "List of allowed connecting IPs"
    type = list(string)
}

variable "tags" {
    description = "Common tags to apply to resources"
    type        = map(string)
}

variable "private_endpoint_subnet_id" {
    description = "Subnet ID in which to deploy the private endpoint"
}
