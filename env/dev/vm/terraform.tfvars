location            = "Central India"
resource_group_name = "buildpiper"
# -----------------------------------------------------------------------
# To add a new VM: copy any block below, change the key & values, done.
# Key = VM name (hyphen only, no underscore - Azure restriction)
# -----------------------------------------------------------------------

vms = {

  # VM 1 - Ubuntu 24.04 x64 Gen2 (Linux)
  "1111-BP-DEV-S1-1" = {
    size           = "Standard_D2s_v3"
    admin_username = "adminuser"
    admin_password = "Password1234!"

    vnet_name                    = "BP_VPC_DEV_S1_1"
    subnet_name                  = "BP_SUB4_DEV_S1_1"
    nsg_name                     = "vm"  # Advanced NIC NSG (created by NSG wrapper)
    create_public_ip             = false # No public IP (non-FW machine)
    computer_name                = null  # Linux - not required
    enable_ip_forwarding         = false
    os_disk_storage_account_type = "Premium_LRS"
    os_disk_size_gb              = 128

    data_disks = {
      "data1" = { size_gb = 128, storage_account_type = "Premium_LRS", lun = 1 }
      "data2" = { size_gb = 128, storage_account_type = "Premium_LRS", lun = 2 }
    }

    # Ubuntu 24.04 x64 Gen2
    image_publisher = "Canonical"
    image_offer     = "ubuntu-24_04-lts"
    image_sku       = "server"
    image_version   = "latest"
    os_type         = "linux"

    patch_mode            = "ImageDefault"
    patch_assessment_mode = "ImageDefault"

    plan_name      = null
    plan_product   = null
    plan_publisher = null

    zone = null # Set "1", "2", or "3" for HA/zone pinning

    # Disk access configuration (private by default)
    public_network_access_enabled = false
    network_access_policy         = "DenyAll"

    tags = {
      Name          = "BP-BP-DEV-S1-1"
      CC            = "BP_DEV_VM"
      CC-Project    = "BP_DEV"
      Customer-Code = "BP"
      Environment   = "DEV"
      Project       = "ClientProject"
      Backup        = "True" # Important: This tag enables backup for this VM
    }
  }

  # VM 2 - Windows Server 2025
  "BP-WIN-DEV-S1-2" = {
    size           = "Standard_D2s_v3"
    admin_username = "adminuser"
    admin_password = "Password1234!"

    vnet_name        = "BP_VPC_DEV_S1_1"
    subnet_name      = "BP_SUB4_DEV_S1_1"
    nsg_name         = "vm"  # Advanced NIC NSG (created by NSG wrapper)
    create_public_ip = false # No public IP (non-FW machine)

    os_disk_storage_account_type = "Premium_LRS"
    os_disk_size_gb              = 128

    data_disks = {
      "data1" = { size_gb = 128, storage_account_type = "Premium_LRS", lun = 1 }
      "data2" = { size_gb = 128, storage_account_type = "Premium_LRS", lun = 2 }
    }

    computer_name        = "BP-WIN-DEV-S1" # Max 15 chars for Windows
    enable_ip_forwarding = false
    # Windows Server 2025
    image_publisher = "MicrosoftWindowsServer"
    image_offer     = "WindowsServer"
    image_sku       = "2025-datacenter-azure-edition"
    image_version   = "latest"
    os_type         = "windows"

    patch_mode            = "AutomaticByPlatform" # Required for Windows 2025 Azure Edition (hotpatch image)
    patch_assessment_mode = "AutomaticByPlatform"

    plan_name      = null
    plan_product   = null
    plan_publisher = null

    zone = null # Set "1", "2", or "3" for HA/zone pinning

    # Disk access configuration (private by default)
    public_network_access_enabled = false
    network_access_policy         = "DenyAll"

    tags = {
      Name          = "BP-WIN-DEV-S1-2"
      CC            = "BP_DEV_VM"
      CC-Project    = "BP_DEV"
      Customer-Code = "BP"
      Environment   = "DEV"
      Project       = "ClientProject"
      Backup        = "True" # Important: This tag enables backup for this VM
    }
  }

  # VM 3 - FW Machine (Rocky Linux - temporary, replace with pfSense when client provides image)
  "1111-BP-DEV-S1-3" = {
    size           = "Standard_D2s_v3"
    admin_username = "adminuser"
    admin_password = "Password1234!"

    vnet_name            = "BP_VPC_DEV_S1_1"
    subnet_name          = "BP_SUB4_DEV_S1_1"
    nsg_name             = "vm" # Advanced NIC NSG (created by NSG wrapper)
    create_public_ip     = true # FW machine - Public IP enabled
    computer_name        = null # Linux - not required
    enable_ip_forwarding = true

    os_disk_storage_account_type = "Premium_LRS"
    os_disk_size_gb              = 128

    data_disks = {
      "data1" = { size_gb = 128, storage_account_type = "Premium_LRS", lun = 1 }
      "data2" = { size_gb = 128, storage_account_type = "Premium_LRS", lun = 2 }
    }

    # Ubuntu 22.04 (temporary - replace with pfSense when client provides image)
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
    os_type         = "linux"

    patch_mode            = "ImageDefault"
    patch_assessment_mode = "ImageDefault"

    plan_name      = null
    plan_product   = null
    plan_publisher = null

    zone = null # Set "1", "2", or "3" for HA/zone pinning

    # Disk access configuration (private by default)
    public_network_access_enabled = false
    network_access_policy         = "DenyAll"

    tags = {
      Name          = "BP-BP-DEV-S1-3"
      CC            = "BP_DEV_VM"
      CC-Project    = "BP_DEV"
      Customer-Code = "BP"
      Environment   = "DEV"
      Project       = "ClientProject"
      Backup        = "False" # Important: This tag EXCLUDES this VM from backup
    }
  }

}

# Route tables to add firewall routes
# TEMPORARILY DISABLED rt3 to allow AKS creation
route_tables = {
  rt1 = { name = "rt-aks-subnet4" }
  rt2 = { name = "rt-aks-subnet5" }
  # rt3 = { name = "rt-aks-subnet7" }  # Disabled - blocking AKS creation
}

# Firewall VM for routing
firewall_vm_name    = "1111-BP-DEV-S1-3"
firewall_route_name = "1111-BP-Firewall-Route"
