output "workspace_id" {
  value = azurerm_log_analytics_workspace.this.id
  description = "ID of the monitoring workspace"
}