resource "azurerm_network_interface" "nic" {
  for_each = var.VM_counting
  name                = format("NIC-count-%s", each.value)
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    name                          = var.ipconfig
    subnet_id                     = var.vsubid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip[each.key].id 
}
}
resource "azurerm_public_ip" "publicip" {
  for_each = var.VM_counting
  name                = format("IP-count-%s", each.value)
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Dynamic"
  
  tags = {
    environment = format("Production-%s",each.value)          
  }
}
