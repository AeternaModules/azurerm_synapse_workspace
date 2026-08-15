output "synapse_workspaces_id" {
  description = "Map of id values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.id if v.id != null && length(v.id) > 0 }
}
output "synapse_workspaces_azure_devops_repo" {
  description = "Map of azure_devops_repo values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => one(v.azure_devops_repo) if v.azure_devops_repo != null && length(v.azure_devops_repo) > 0 }
}
output "synapse_workspaces_azuread_authentication_only" {
  description = "Map of azuread_authentication_only values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.azuread_authentication_only if v.azuread_authentication_only != null }
}
output "synapse_workspaces_compute_subnet_id" {
  description = "Map of compute_subnet_id values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.compute_subnet_id if v.compute_subnet_id != null && length(v.compute_subnet_id) > 0 }
}
output "synapse_workspaces_connectivity_endpoints" {
  description = "Map of connectivity_endpoints values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.connectivity_endpoints if v.connectivity_endpoints != null && length(v.connectivity_endpoints) > 0 }
}
output "synapse_workspaces_customer_managed_key" {
  description = "Map of customer_managed_key values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => one(v.customer_managed_key) if v.customer_managed_key != null && length(v.customer_managed_key) > 0 }
}
output "synapse_workspaces_data_exfiltration_protection_enabled" {
  description = "Map of data_exfiltration_protection_enabled values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.data_exfiltration_protection_enabled if v.data_exfiltration_protection_enabled != null }
}
output "synapse_workspaces_github_repo" {
  description = "Map of github_repo values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => one(v.github_repo) if v.github_repo != null && length(v.github_repo) > 0 }
}
output "synapse_workspaces_identity" {
  description = "Map of identity values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => one(v.identity) if v.identity != null && length(v.identity) > 0 }
}
output "synapse_workspaces_linking_allowed_for_aad_tenant_ids" {
  description = "Map of linking_allowed_for_aad_tenant_ids values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.linking_allowed_for_aad_tenant_ids if v.linking_allowed_for_aad_tenant_ids != null && length(v.linking_allowed_for_aad_tenant_ids) > 0 }
}
output "synapse_workspaces_location" {
  description = "Map of location values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.location if v.location != null && length(v.location) > 0 }
}
output "synapse_workspaces_managed_resource_group_name" {
  description = "Map of managed_resource_group_name values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.managed_resource_group_name if v.managed_resource_group_name != null && length(v.managed_resource_group_name) > 0 }
}
output "synapse_workspaces_managed_virtual_network_enabled" {
  description = "Map of managed_virtual_network_enabled values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.managed_virtual_network_enabled if v.managed_virtual_network_enabled != null }
}
output "synapse_workspaces_name" {
  description = "Map of name values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.name if v.name != null && length(v.name) > 0 }
}
output "synapse_workspaces_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "synapse_workspaces_purview_id" {
  description = "Map of purview_id values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.purview_id if v.purview_id != null && length(v.purview_id) > 0 }
}
output "synapse_workspaces_resource_group_name" {
  description = "Map of resource_group_name values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "synapse_workspaces_sql_administrator_login" {
  description = "Map of sql_administrator_login values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.sql_administrator_login if v.sql_administrator_login != null && length(v.sql_administrator_login) > 0 }
}
output "synapse_workspaces_sql_administrator_login_password" {
  description = "Map of sql_administrator_login_password values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.sql_administrator_login_password if v.sql_administrator_login_password != null && length(v.sql_administrator_login_password) > 0 }
  sensitive   = true
}
output "synapse_workspaces_sql_identity_control_enabled" {
  description = "Map of sql_identity_control_enabled values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.sql_identity_control_enabled if v.sql_identity_control_enabled != null }
}
output "synapse_workspaces_storage_data_lake_gen2_filesystem_id" {
  description = "Map of storage_data_lake_gen2_filesystem_id values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.storage_data_lake_gen2_filesystem_id if v.storage_data_lake_gen2_filesystem_id != null && length(v.storage_data_lake_gen2_filesystem_id) > 0 }
}
output "synapse_workspaces_tags" {
  description = "Map of tags values across all synapse_workspaces, keyed the same as var.synapse_workspaces"
  value       = { for k, v in azurerm_synapse_workspace.synapse_workspaces : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

