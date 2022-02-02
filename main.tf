# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "terraformlearningrg"
  location = var.location
  tags = var.tags
}

resource "azurerm_virtual_network" "vnet"{
  name = "${var.prefix}-vnet"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name = "{var.prefix}-subnet1"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name="{var.prefix}-nic"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration{
    name ="test1"
    subnet_id = azurerm_subnet.subnet1.id
    private_ip_address_allocation="Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm1" {
  name = "{var.prefix}-vm"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size="Standard_DS1_v2"
  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true
  storage_image_reference{
    publisher = "Canonical"
    offer= "UbuntuServer"
    sku="16.04-LTS"
    version = "Latest"
  }
  storage_os_disk {
    name="osdisk1"
    caching = "Readwrite"
    create_option = "FromImage"
    managed_disk_type ="Standard_LRS"
  }
  os_profile {
    computer_name = "testvm"
    admin_username = "admin"
    admin_password = "Test@1994"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  }
  
  
  

  

