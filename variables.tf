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
    location                             = string
    name                                 = string
    resource_group_name                  = string
    storage_data_lake_gen2_filesystem_id = string
    azuread_authentication_only          = optional(bool) # Default: false
    compute_subnet_id                    = optional(string)
    data_exfiltration_protection_enabled = optional(bool)
    linking_allowed_for_aad_tenant_ids   = optional(list(string))
    managed_resource_group_name          = optional(string)
    managed_virtual_network_enabled      = optional(bool)
    public_network_access_enabled        = optional(bool) # Default: true
    purview_id                           = optional(string)
    sql_administrator_login              = optional(string)
    sql_administrator_login_password     = optional(string)
    sql_identity_control_enabled         = optional(bool)
    tags                                 = optional(map(string))
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
      key_name                  = optional(string) # Default: "cmk"
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
  # --- Unconfirmed validation candidates, derived from azurerm_synapse_workspace's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.WorkspaceName] !ok
  # path: name
  #   source:    [from validate.WorkspaceName] !regexp.MustCompile(`^[a-z0-9]([a-z0-9-]{0,48}[a-z0-9])?$`).MatchString(v)
  # path: name
  #   source:    [from validate.WorkspaceName] strings.Contains(v, "-ondemand")
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: storage_data_lake_gen2_filesystem_id
  #   source:    validation.IsURLWithPath(...) - no translation rule yet, add one
  # path: sql_administrator_login
  #   source:    [from validate.SqlAdministratorLoginName] !ok
  # path: sql_administrator_login
  #   source:    [from validate.SqlAdministratorLoginName] !regexp.MustCompile(`^[a-zA-Z][a-zA-Z\d-]{0,127}$`).MatchString(v)
  # path: compute_subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: compute_subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: managed_resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: managed_resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: managed_resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: managed_resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: azure_devops_repo.root_folder
  #   source:    validate.RepoRootFolder: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: github_repo.git_url
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: github_repo.root_folder
  #   source:    validate.RepoRootFolder: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: purview_id
  #   source:    [from account.ValidateAccountID] !ok
  # path: purview_id
  #   source:    [from account.ValidateAccountID] err != nil
  # path: customer_managed_key.key_versionless_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: customer_managed_key.key_versionless_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

