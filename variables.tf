variable "synapse_workspaces" {
  description = <<EOT
Map of synapse_workspaces, attributes below
Required:
    - location
    - name
    - resource_group_name
    - storage_data_lake_gen2_filesystem_id
Optional:
    - azuread_authentication_only
    - compute_subnet_id
    - data_exfiltration_protection_enabled
    - linking_allowed_for_aad_tenant_ids
    - managed_resource_group_name
    - managed_virtual_network_enabled
    - public_network_access_enabled
    - purview_id
    - sql_administrator_login
    - sql_administrator_login_password
    - sql_administrator_login_password_key_vault_id (alternative to sql_administrator_login_password - read from Key Vault instead)
    - sql_administrator_login_password_key_vault_secret_name (alternative to sql_administrator_login_password - read from Key Vault instead)
    - sql_identity_control_enabled
    - tags
    - azure_devops_repo (block):
        - account_name (required)
        - branch_name (required)
        - last_commit_id (optional)
        - project_name (required)
        - repository_name (required)
        - root_folder (required)
        - tenant_id (optional)
    - customer_managed_key (block):
        - key_name (optional)
        - key_versionless_id (required)
        - user_assigned_identity_id (optional)
    - github_repo (block):
        - account_name (required)
        - branch_name (required)
        - git_url (optional)
        - last_commit_id (optional)
        - repository_name (required)
        - root_folder (required)
    - identity (block):
        - identity_ids (optional)
        - type (required)
EOT

  type = map(object({
    location                                               = string
    name                                                   = string
    resource_group_name                                    = string
    storage_data_lake_gen2_filesystem_id                   = string
    azuread_authentication_only                            = optional(bool)
    compute_subnet_id                                      = optional(string)
    data_exfiltration_protection_enabled                   = optional(bool)
    linking_allowed_for_aad_tenant_ids                     = optional(list(string))
    managed_resource_group_name                            = optional(string)
    managed_virtual_network_enabled                        = optional(bool)
    public_network_access_enabled                          = optional(bool)
    purview_id                                             = optional(string)
    sql_administrator_login                                = optional(string)
    sql_administrator_login_password                       = optional(string)
    sql_administrator_login_password_key_vault_id          = optional(string)
    sql_administrator_login_password_key_vault_secret_name = optional(string)
    sql_identity_control_enabled                           = optional(bool)
    tags                                                   = optional(map(string))
    azure_devops_repo = optional(object({
      account_name    = string
      branch_name     = string
      last_commit_id  = optional(string)
      project_name    = string
      repository_name = string
      root_folder     = string
      tenant_id       = optional(string)
    }))
    customer_managed_key = optional(object({
      key_name                  = optional(string)
      key_versionless_id        = string
      user_assigned_identity_id = optional(string)
    }))
    github_repo = optional(object({
      account_name    = string
      branch_name     = string
      git_url         = optional(string)
      last_commit_id  = optional(string)
      repository_name = string
      root_folder     = string
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.managed_resource_group_name == null || (length(v.managed_resource_group_name) <= 90)
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.managed_resource_group_name == null || (!endswith(v.managed_resource_group_name, "."))
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.managed_resource_group_name == null || (length(v.managed_resource_group_name) != 0)
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.azure_devops_repo == null || (length(v.azure_devops_repo.account_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.azure_devops_repo == null || (length(v.azure_devops_repo.branch_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.azure_devops_repo == null || (v.azure_devops_repo.last_commit_id == null || (length(v.azure_devops_repo.last_commit_id) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.azure_devops_repo == null || (length(v.azure_devops_repo.project_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.azure_devops_repo == null || (length(v.azure_devops_repo.repository_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.azure_devops_repo == null || (v.azure_devops_repo.tenant_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.azure_devops_repo.tenant_id))))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.github_repo == null || (length(v.github_repo.account_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.github_repo == null || (length(v.github_repo.branch_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.github_repo == null || (v.github_repo.last_commit_id == null || (length(v.github_repo.last_commit_id) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.github_repo == null || (length(v.github_repo.repository_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspaces : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 24 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

