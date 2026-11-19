variable "project_name" {
  description = "Base name for all resources"
  type        = string
  default     = "nimbus-rg"
}

variable "location" {
  description = "Azure region to deploy resources (e.g.,eastus)"
  type        = string
  default     = "East Us"
}

variable "tags" {
  description = "common tags applied to all resources"
  type        = map(string)
  default = {
    environment = "Dev"
    owner       = "nimbus"
  }
}

# ACR
variable "acr_sku" {
  description = "SKU for Azure Container Registry (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

# AKS
variable "aks_node_count" {
  description = "number of nodes in the default AKS node pool"
  type        = number
  default     = 1
}

variable "aks_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D2_v4"
}

# Key Vault
variable "kv_sku" {
  description = "SKU for Azure Key Vault (standard or premium)"
  type        = string
  default     = "standard"
}

# Storage
variable "storage_replication_type" {
  description = "Replication type for the storage account (LRS, GRS, RAGRS)"
  type        = string
  default     = "LRS"
}