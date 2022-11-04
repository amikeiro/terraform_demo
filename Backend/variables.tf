# Variables used in the main.tf file for the Backend

### Variables for Atea Sandbox subscription rules 

variable "office_region" {
  description = "The Atea region in which the office to deploy resources is located"
  type        = string
}

variable "office" {
  description = "The Atea office that deploys the resources"
  type        = string
}

variable "customer" {
  description = "Atea or the Atea's customer that the infrastructure is deployed for"
  type        = string
}

### Variables for Azure Terraform solution

variable "region" {
  description = "Region in which to deploy resources"
  type        = string
}

variable "project" {
  description = "Name of the project configuration belongs to."
  type        = string
}

variable "environment" {
  description = "Environment in which to deploy"
}

variable "common_tags" {
  description = "Common tags to apply to resources"
  type        = map(string)
}

variable "vnet_address_space" {
    description = "Address space for the vnet"
    type = list(string)
}

variable "subnet_address_space" {
    description = "Address space for the snet"
    type = list(string)
}

variable "ip_allow_list" {
    description = "List of source IP Exceptions to firewall"
    type = list(string) 
}