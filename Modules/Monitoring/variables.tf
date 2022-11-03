variable "project" {
    description = "Name of the project"
    type = string  
}

variable "environment" {
    description = "Name of the environment"
    type = string  
}

variable "region" {
    description = "Name of region"
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