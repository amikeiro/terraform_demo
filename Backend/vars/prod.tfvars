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
    "Environment"   : "dev",
    "Owner" : "amir.kheirollah@atea.no",
    "ProvisionMethod" : "Terraform",
    "CreationContext" : "Permanent",
    "costcenter" : "141011"
}


#>>>>>>>>>>>>>>>>>>>>>>>>>>Network<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

vnet_address_space = ["10.108.0.0/20"]
subnet_address_space = ["10.108.0.0/24"]
ip_allow_list = [
    #"91.184.138.88" # PC Atea
    #"10.108.0.0"
    #"10.29.69.150"
    "188.244.64.7" # The IP address of local PC. Replace it with yours: Window key + R, type cmd.exe or cmd, press enter, in the command prompt window type "ipconfig" or "nslookup myip.opendns.com resolber1.opendns.com" to get your local PC IP address. 
]