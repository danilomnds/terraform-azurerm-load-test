resource "azurerm_load_test" "load_test" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  description         = var.description
  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
      principal_id = lookup(identity.value, "principal_id", null)
      tenant_id    = lookup(identity.value, "tenant_id", null)
    }
  }
  tags = local.tags
  lifecycle {
    ignore_changes = [
      tags["create_date"]
    ]
  }
}

resource "azurerm_role_assignment" "load_test_reader" {
  depends_on = [azurerm_load_test.load_test]
  for_each = {
    for group in var.azure_ad_groups : group => group
    if var.azure_ad_groups != []
  }
  scope                = azurerm_load_test.load_test.id
  role_definition_name = "Load Test Contributor"
  principal_id         = each.value
  lifecycle {
    ignore_changes = [
      scope
    ]
  }
}