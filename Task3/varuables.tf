variable "prefix" {
  default = "2"
}

variable "resource_group_location" {
  default       = "West Europe"
  description   = "Location of the resource group."
}

variable "pasubuntu" {
  description = "Value of the password for the azure instance"
  type        = string
  default     = "ExampleString"
}
variable "pascentos" {
  description = "Value of the password tag for the azure instance"
  type        = string
  default     = "ExampleString"
}
