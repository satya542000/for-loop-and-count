resource "azurerm_windows_virtual_machine" "vmcount" {
  count = length(var.VM_counting)
  name                = format("${var.VM_counting[count.index]}-%g", count.index+1)
  resource_group_name = var.rg
  location            = var.location
  size                = var.size
  admin_username      = var.vmuser_name
  admin_password      = var.user_password
  network_interface_ids = [var.nic[count.index]]
  os_disk {
    caching              = var.rights
    storage_account_type = var.storage
  }

  source_image_reference {
    publisher = var.micsft
    offer     = var.win
    sku       = var.vmwin_versing
    version   = "latest"
  }
}