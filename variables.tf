variable "name" {
  type        = string
  default     = null
  description = "Name of the MariaDB server. If this input is not specified, a random ID is set as the name."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name in which the resources should be created"
}

# SKU
variable "sku_name" {
  default     = "B_Standard_B1ms"
  description = <<-EOT
  The SKU Name for the PostgreSQL Flexible Server.
  The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3
  EOT
}



variable "storage" {
  type = object({
    auto_grow             = bool
    size                  = number
    backup_retention_days = number
    geo_redundant_backup  = bool
  })

  default = {
    auto_grow             = true
    size                  = 32768
    backup_retention_days = 30
    geo_redundant_backup  = false
  }

  description = <<-EOT
  auto_grow: Is the storage auto grow for PostgreSQL Flexible Server enabled? Defaults to false.
  size: The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216 and 33553408
  backup_retention_days: The backup retention days for the PostgreSQL Flexible Server. Possible values are between 7 and 35 days.
  geo_redundant_backup: Is Geo-Redundant backup enabled on the PostgreSQL Flexible Server. Defaults to false. Changing this forces a new PostgreSQL Flexible Server to be created.
  EOT
}

variable "administrator_login" {
  type    = string
  default = "pgsqladmin"
}

variable "engine_version" {
  type    = string
  default = "12"
}


variable "trusted_network_cidr" {
  type = map(string)
  default = {
    azure_internal = "0.0.0.0/32"
  }

  description = <<-EOT
  Trusted networks to allow access to e.g. Redis and PostgreSQL.
  The key may only contain alphanumeric characters and underscores.
  EOT
}


variable "tags" {
  type        = map(string)
  description = "The tags set allow to identify the resources that are managed by Terraform."
  default = {
    TF-Managed  = "true"
    Maintainer  = ""
    TF-Worfklow = ""
  }
}

variable "configuration" {
  type    = map(string)
  default = {}
}
