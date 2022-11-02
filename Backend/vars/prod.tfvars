# Common variables' values

#office_region = "Øst"
office_region = "Ost"
office = "Oslo"
customer = "Atea"
region = "West Europe"
project = "innsikt"
environment = "prod"
common_tags = {
    "Service"   : "innsikt",
    "Environment"   : "prod"
    "Owner" : "amir.kheirollah@atea.no"
    "ProvisionMethod" : "Terraform"
    "CreationContext" : "Permanent"
    "costcenter" : "141011"
}

#>>>>>>>>>>>>>>>>>>>>>>>>>>Network<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

vnet_address_space = ["10.108.0.0/20"]
subnet_address_space = ["10.108.0.0/24"]