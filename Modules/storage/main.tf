# This file is the main command to code the module for the storage account
data "azurerm_client_config" "current" {}

resource "azurerm_storage_account" "this" {
    name = var.account_name
    resource_group_name = var.resource_group_name
    location = var.region
    account_tier = "Standard"
    account_replication_type = "LRS"
    is_hns_enabled = true # Is hierarchical Namespace enabled?

    network_rules {
      default_action = "Deny"
      ip_rules = var.allowed_ips
      virtual_network_subnet_ids = var.allowed_subnets
    }

    tags = var.tags
}

# Monitoring of the storage account set up 
data "azurerm_monitor_diagnostic_categories" "storage" {
    resource_id = "${azurerm_storage_account.this.id}/blobservices/default"
}

resource "azurerm_monitor_diagnostic_setting" "storage" {
    name = "logging_storage"
    target_resource_id = "${azurerm_storage_account.this.id}/blobservices/default"
    log_analytics_workspace_id = var.log_analytics_workspace_id


    dynamic "log" {
        for_each = data.azurerm_monitor_diagnostic_categories.storage.logs
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
        category = "Capacity"
        enabled = false
        retention_policy {
            days = 0
            enabled = false
        }
    }
    metric {
        category = "Transaction"
        enabled = false
        retention_policy {
            days = 0
            enabled = false
        }
    }
}