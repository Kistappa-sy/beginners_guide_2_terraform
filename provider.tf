# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
    #subscription_id = "var.subscription_id"
    #client_id = "var.client_id"
    #client_secret = "var.client_secret"
    #tenant_id = "var.tenant_id"
}

/* terraform {
    backend "azurerm"{
        resource_group_name=""
        storage_account_name=""
        container_name=""
        key=""
    }
} */