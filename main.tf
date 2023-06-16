data ibm_resource_group "resource_group" {
    name = "satellite-rg"
}

locals {
  server_count_control_plane = 3
  server_count_host = 2
}

resource "ibm_compute_vm_instance" "virtual-server-classic-control-plane" {
  count                      = local.server_count_control_plane
  hostname                   = "control-plane-virtual-server-${count.index + 1}"
  domain                     = "IBM-PoC-Landing-Zone-Enterprise.cloud"
  os_reference_code          = "REDHAT_7_64"
  datacenter                 = "dal13"
  network_speed              = 10
  hourly_billing             = false
  private_network_only       = false
  cores                      = 4
  memory                     = 16384
  disks                      = [25]
  user_metadata              = "{\"value\":\"newvalue\"}"
  dedicated_acct_host_only   = true
  local_disk                 = false
}

resource "ibm_compute_vm_instance" "virtual-server-classic-host" {
  count                      = local.server_count_host
  hostname                   = "host-virtual-server-${count.index + 1}"
  domain                     = "IBM-PoC-Landing-Zone-Enterprise.cloud"
  os_reference_code          = "REDHAT_7_64"
  datacenter                 = "dal13"
  network_speed              = 10
  hourly_billing             = false
  private_network_only       = false
  cores                      = 4
  memory                     = 16384
  disks                      = [25]
  user_metadata              = "{\"value\":\"newvalue\"}"
  dedicated_acct_host_only   = true
  local_disk                 = false
}