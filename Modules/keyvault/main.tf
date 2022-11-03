resource "azurerm_key_vault" "this" {
    name = "kv-${var.project}-${var.environment}"
    resource_group_name = var.resource_group
    location = var.region
    tenant_id = var.tenant_id
    purge_protection_enabled = false
    sku_name = "standard"


# Deny or allow (Control) Traffic to subnets using network ACLs

    network_acls {
        default_action = "Deny"
        bypass = "AzureServices"
        virtual_network_subnet_ids = var.allowed_subnets
        ip_rules = var.allowed_
    }
    tags = var.tags
}


# Setting up the keyvault access policy for a user

resource "azurerm_key_vault_access_policy" "user" {
  key_vault_id = azurerm_key_vault.this.id
  tenant_id = var.tenant_id
  object_id = var.object
  
  key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore"]
  secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
  certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetIssuers", "ManageIssuers", "ListIssuers", "SetIssuers", "ManageContacts", "DeleteIssuers"]
  storage_permissions     = ["Get"]
}