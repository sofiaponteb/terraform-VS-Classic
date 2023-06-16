data ibm_resource_group "resource_group" {
    name = "Default"
}

locals {
  server_count = 2
}

resource "ibm_compute_vm_instance" "virtual-server-classic" {
  count                      = local.server_count
  hostname                   = "virtual-server-${count.index + 1}"
  domain                     = "IBM-PoC-Landing-Zone-Enterprise.cloud"
  os_reference_code          = "REDHAT_7_64"
  datacenter                 = "dal13"
  network_speed              = 10
  hourly_billing             = false
  private_network_only       = false
  cores                      = 4
  memory                     = 16
  disks                      = [25]
  user_metadata              = "{\"value\":\"newvalue\"}"
  dedicated_acct_host_only   = true
  local_disk                 = false
}