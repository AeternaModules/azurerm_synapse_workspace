output "synapse_workspaces" {
  description = "All synapse_workspace resources"
  value       = azurerm_synapse_workspace.synapse_workspaces
  sensitive   = true
}
output "synapse_workspaces_azure_devops_repo" {
  description = "List of azure_devops_repo values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.azure_devops_repo]
}
output "synapse_workspaces_azuread_authentication_only" {
  description = "List of azuread_authentication_only values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.azuread_authentication_only]
}
output "synapse_workspaces_compute_subnet_id" {
  description = "List of compute_subnet_id values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.compute_subnet_id]
}
output "synapse_workspaces_connectivity_endpoints" {
  description = "List of connectivity_endpoints values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.connectivity_endpoints]
}
output "synapse_workspaces_customer_managed_key" {
  description = "List of customer_managed_key values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.customer_managed_key]
}
output "synapse_workspaces_data_exfiltration_protection_enabled" {
  description = "List of data_exfiltration_protection_enabled values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.data_exfiltration_protection_enabled]
}
output "synapse_workspaces_github_repo" {
  description = "List of github_repo values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.github_repo]
}
output "synapse_workspaces_identity" {
  description = "List of identity values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.identity]
}
output "synapse_workspaces_linking_allowed_for_aad_tenant_ids" {
  description = "List of linking_allowed_for_aad_tenant_ids values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.linking_allowed_for_aad_tenant_ids]
}
output "synapse_workspaces_location" {
  description = "List of location values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.location]
}
output "synapse_workspaces_managed_resource_group_name" {
  description = "List of managed_resource_group_name values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.managed_resource_group_name]
}
output "synapse_workspaces_managed_virtual_network_enabled" {
  description = "List of managed_virtual_network_enabled values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.managed_virtual_network_enabled]
}
output "synapse_workspaces_name" {
  description = "List of name values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.name]
}
output "synapse_workspaces_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.public_network_access_enabled]
}
output "synapse_workspaces_purview_id" {
  description = "List of purview_id values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.purview_id]
}
output "synapse_workspaces_resource_group_name" {
  description = "List of resource_group_name values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.resource_group_name]
}
output "synapse_workspaces_sql_administrator_login" {
  description = "List of sql_administrator_login values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.sql_administrator_login]
}
output "synapse_workspaces_sql_administrator_login_password" {
  description = "List of sql_administrator_login_password values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.sql_administrator_login_password]
  sensitive   = true
}
output "synapse_workspaces_sql_identity_control_enabled" {
  description = "List of sql_identity_control_enabled values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.sql_identity_control_enabled]
}
output "synapse_workspaces_storage_data_lake_gen2_filesystem_id" {
  description = "List of storage_data_lake_gen2_filesystem_id values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.storage_data_lake_gen2_filesystem_id]
}
output "synapse_workspaces_tags" {
  description = "List of tags values across all synapse_workspaces"
  value       = [for k, v in azurerm_synapse_workspace.synapse_workspaces : v.tags]
}

