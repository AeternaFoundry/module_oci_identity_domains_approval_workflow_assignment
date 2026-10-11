resource "oci_identity_domains_approval_workflow_assignment" "identity_domains_approval_workflow_assignments" {
  for_each = var.identity_domains_approval_workflow_assignments

  assignment_type              = each.value.assignment_type
  idcs_endpoint                = each.value.idcs_endpoint
  schemas                      = each.value.schemas
  attribute_sets               = each.value.attribute_sets
  attributes                   = each.value.attributes
  authorization                = each.value.authorization
  ocid                         = each.value.ocid
  resource_type_schema_version = each.value.resource_type_schema_version

  approval_workflow {
    ocid  = each.value.approval_workflow.ocid
    type  = each.value.approval_workflow.type
    value = each.value.approval_workflow.value
  }

  assigned_to {
    ocid  = each.value.assigned_to.ocid
    type  = each.value.assigned_to.type
    value = each.value.assigned_to.value
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

