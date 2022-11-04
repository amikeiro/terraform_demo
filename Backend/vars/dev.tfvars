# Common variables' values

#office_region = "East"
office_region = "Ost"
office = "Oslo"
customer = "Atea"
region = "West Europe"
project = "innsikt"
environment = "dev"
common_tags = {
    "Service"   : "innsikt",
    "Environment"   : "dev"
    "Owner" : "amir.kheirollah@atea.no"
    "ProvisionMethod" : "Terraform"
    "CreationContext" : "Permanent"
    "costcenter" : "141011"
}

#>>>>>>>>>>>>>>>>>>>>>>>>>>Network<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

vnet_address_space = ["10.108.0.0/20"]
subnet_address_space = ["10.108.0.0/24"]
ip_allow_list = [
    #"91.184.138.88" # PC Atea
    "10.108.0.0"
]