variable "identity_domains_approval_workflow_assignments" {
  description = <<EOT
Map of identity_domains_approval_workflow_assignments, attributes below
Required:
    - assignment_type
    - idcs_endpoint
    - schemas
    - approval_workflow (block):
        - ocid (optional)
        - type (required)
        - value (required)
    - assigned_to (block):
        - ocid (optional)
        - type (required)
        - value (required)
Optional:
    - attribute_sets
    - attributes
    - authorization
    - ocid
    - resource_type_schema_version
    - tags (block):
        - key (required)
        - value (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    assignment_type              = string
    idcs_endpoint                = string
    schemas                      = list(string)
    attribute_sets               = optional(list(string))
    attributes                   = optional(string)
    authorization                = optional(string)
    ocid                         = optional(string)
    resource_type_schema_version = optional(string)
    approval_workflow = object({
      ocid  = optional(string)
      type  = string
      value = string
    })
    assigned_to = object({
      ocid  = optional(string)
      type  = string
      value = string
    })
    tags = optional(list(object({
      key   = string
      value = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

