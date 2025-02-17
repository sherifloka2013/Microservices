terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"  // Specify a version compatible with your needs
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "b059d3da-d469-4620-a868-895ad5e41dc2"
  tenant_id       = "29253059-3360-47aa-b006-0b348878784f"
  client_id       = "4fd797f1-0df9-4c6f-9064-f8d87a9e6703"
  client_secret   = "rXc8Q~WQi3ax73er8WoeJ07mZT4cNExNc3Vzodub"
//TODO var.client_secret  // Use a variable or environment variable
}

resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "myAKSCluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myaksdns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

variable "client_secret" {
  description = "The Client Secret for Azure provider"
  type        = string
  sensitive   = true
}
