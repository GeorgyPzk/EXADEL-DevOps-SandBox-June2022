#resource group creation
####################################################################
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}rg"
  location = var.resource_group_location
}

# Create virtual network
resource "azurerm_virtual_network" "network" {
  name                = "${var.prefix}myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}



#######################################################################
# azurerm_subnet_network_security_group_association
resource "azurerm_subnet_network_security_group_association" "sgassociationUB" {
  subnet_id                 = azurerm_subnet.subnetUB.id
  network_security_group_id = azurerm_network_security_group.nsgUB.id
}

resource "azurerm_subnet_network_security_group_association" "sgassociationCentOS" {
  subnet_id                 = azurerm_subnet.subnetCentOS.id
  network_security_group_id = azurerm_network_security_group.nsgCentOS.id
}

#######################################################################
#UBUNTU
#######################################################################
# Create public IPs
resource "azurerm_public_ip" "publicipUB" {
  name                = "${var.prefix}PublicIPUB"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

# Create subnet
resource "azurerm_subnet" "subnetUB" {
  name                 = "${var.prefix}mySubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create Network Security Group and rule
# Security group UB
resource "azurerm_network_security_group" "nsgUB" {
  name                = "${var.prefix}subnetsgUB"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "tcp22"
    priority                   = 2000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "tcp80"
    priority                   = 2200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "tcp443"
    priority                   = 2400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  #OUTBOUND RULES 
  security_rule {
    name                       = "InternetAccess"
    priority                   = 400
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*" 
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "nicUB" {
  name                = "${var.prefix}NicUB"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.prefix}NicConfiguration"
    subnet_id                     = azurerm_subnet.subnetUB.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicipUB.id
  }
}


# Ubuntu VM creation
resource "azurerm_virtual_machine" "vmUB" {
  name                  = "${var.prefix}vmubuntu"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nicUB.id]
  vm_size               = "Standard_D2as_v5"
  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_os_disk {
    name              = "${var.prefix}osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = var.pasubuntu
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

#azurerm_virtual_machine_extension
resource "azurerm_virtual_machine_extension" "vmext" {
  name                 = "${var.prefix}vmext"
  virtual_machine_id   = azurerm_virtual_machine.vmUB.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  protected_settings = <<PROT
    {
        "script": "${base64encode(file("script.sh"))}"
    }
    PROT
}

#######################################################################
#CentOS
#######################################################################
resource "azurerm_subnet" "subnetCentOS" {
  name                 = "${var.prefix}subnetCentOS"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = ["10.0.2.0/28"]
}

resource "azurerm_network_security_group" "nsgCentOS" {
  name                = "${var.prefix}subnetcentossg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  #Inbound rules
  security_rule {
    name                       = "DenyAllInbond"
    priority                   = 3000
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*" 
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  #Outbound rules
  security_rule {
    name                       = "DenyAllOutbound"
    priority                   = 3200
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  # Inbound rules for vmUB
  security_rule {
    name                       = "INtcp22"
    priority                   = 2000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "INtcp80"
    priority                   = 2200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "INtcp443"
    priority                   = 2400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
  # OutBount for vmUB
  security_rule {
    name                       = "OUTtcp22"
    priority                   = 2000
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "OUTtcp80"
    priority                   = 2200
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "OUTtcp443"
    priority                   = 2400
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "nicCentOS" {
  name                = "${var.prefix}nicCentOS"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.prefix}ipc2"
    subnet_id                     = azurerm_subnet.subnetCentOS.id
    private_ip_address_allocation = "Dynamic"
  }
}

# CentOS VM creation
resource "azurerm_virtual_machine" "vmcentos" {
  name                  = "${var.prefix}vmcentos"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nicCentOS.id]
  vm_size               = "Standard_D2as_v5"
  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true
  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true
  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"        
  }
  storage_os_disk {
    name              = "${var.prefix}myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = var.pascentos
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}