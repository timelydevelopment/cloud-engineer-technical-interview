variable "sql_db_service_name_prefix" {
  description = "Service Name prefix for SQL DB"
}

variable "sql_db_environment" {
  description = "Name of the environment the SQL DB is in"
}

variable "sql_db_resource_tags" {
  description = "The Azure tags for the SQL DB"
  default     = {}
  type        = map(string)
}

variable "sql_db_server_id" {
  description = "The keyvault id for where the secrets for the SQL Server are stored"
}
