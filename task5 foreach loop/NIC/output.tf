output "nicid" {
    value = [for u in azurerm_network_interface.nic : u.id]
}