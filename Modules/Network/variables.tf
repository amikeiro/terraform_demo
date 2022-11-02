variable "project" {
    description = "Name of the project"
    type = string  
}

variable "region" {
    description = "Name of target region"
    type = string  
}


variable "environment" {
    description = "Name of target environment"
    #type = string  
}

variable "resource_group_name" {
    description = "Name of resource group"
    type = string
}

variable "vnet_address_space" {
    description = "Address space for the vnet"
    type = list(string)
}

variable "subnet_address_space" {
    description = "Address space for the snet"
    type = list(string)
}

variable "tags" {
    description = "Tags for the resource"
    type = map(string)
}