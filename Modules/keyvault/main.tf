resource "azurerm_key_vault" "this" {
    name = "kv-${var.project}-${var.environment}"
    resource_group_name = var.resource_group_name
    location = var.region
    tenant_id = var.tenant_id
    purge_protection_enabled = false
    sku_name = "standard"


# Deny or allow (Control) Traffic to subnets using network ACLs

    network_acls {
        default_action = "Deny"
        bypass = "AzureServices"
        virtual_network_subnet_ids = var.allowed_subnets
        ip_rules = var.allowed_ips
    }
    tags = var.tags
}


# Setting up the keyvault access policy for a user -

resource "azurerm_key_vault_access_policy" "user" {
  key_vault_id = azurerm_key_vault.this.id
  tenant_id = var.tenant_id
  object_id = var.object_id
  #object_id = data.azurerm_client_config.user.object_id
  
  key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore"]
  secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
  certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetIssuers", "ManageIssuers", "ListIssuers", "SetIssuers", "ManageContacts", "DeleteIssuers"]
  storage_permissions     = ["Get"]
}


## Setting up the private endpoint

resource "azurerm_private_endpoint" "this" {
    name = "pe-${azurerm_key_vault.this.name}"
    resource_group_name = var.resource_group_name
    location = var.region
    subnet_id = var.private_endpoint_subnet_id

    private_service_connection {
        name = "pe-${azurerm_key_vault.this.name}-connection"
        private_connection_resource_id = azurerm_key_vault.this.id
        subresource_names = ["Vault"]
        is_manual_connection = false
    }
}

## Setting up keyvault for monitoring (log-analytics)

data "azurerm_monitor_diagnostic_categories" "keyvault" {
  resource_id = azurerm_key_vault.this.id
}


resource "azurerm_monitor_diagnostic_setting" "keyvault" {
  name               = "logging-vault-${var.project}-${var.environment}"
  target_resource_id = azurerm_key_vault.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.keyvault.logs
    content {
        category = log.value
        enabled = true
        retention_policy {
            days = 0
            enabled = false
        }
    }
}

metric {
    category = "AllMetrics"
    enabled = false
    retention_policy {
        days = 0
        enabled = false
    }
  }
}