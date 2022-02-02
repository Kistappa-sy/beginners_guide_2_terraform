# definining varaiables here
variable "prefix" {
    type = string
    description = "describe your variable"
}

# defining empty type here, means it will accept any kind of input values, available types are string, object, number
variable "tags" {
    default = {
        environment="dev"
    }
}

variable "location" {
    type = string
    description = "location where your azure resource needs to provision"
    default = "eastus"
}

/*variable "subscription_id" {
    type = string
    description = "describe your variable"
  
}

variable "client_id" {
    type = string
    description = "describe your variable"
  
}

variable "client_secret" {
    type = string
    description = "describe your variable"
  
}

variable "tenant_id" {
    type = string
    description = "describe your variable"
  
}
*/