variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "description" {
  type = string
  default = null
}

variable "identity" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Container Registry"
  type = object({
    type         = string
    identity_ids = optional(list(string))
    principal_id = optional(string)
    tenant_id    = optional(string)
  })
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "azure_ad_groups" {
  type    = list(string)
  default = []
}