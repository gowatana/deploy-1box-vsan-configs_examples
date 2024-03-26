# ----------------------------------------
# Common Cluster settings

$nest_dc_name = "lab-dc-01"
$nest_cluster_name = "lab-cluster-01-OSA-AllFlash"
$vm_num = 3
$hv_ip_4oct_start = 111 # 4th Octet for ESXi-vmk0-IP

# ----------------------------------------
# Nested ESXi VM settings

# Nested ESXi VM Template
$template_vm_name = "esxi80u2b-template-01"
$linked_clone = $false

# Nested ESXi VM Name
$vm_name_prefix = "vm-lab-esxi-"

# Nested ESXi VM Spec
$esxi_vcpu = 2
$esxi_memory_gb = 16

# ----------------------------------------
# Nested ESXi Hypervisor settings

# Nested ESXi User / Password
$hv_user = "root"
$hv_pass = "VMware1!"

# Nested ESXi Hostname Prefix
$nest_hv_hostname_prefix = "lab-esxi-"
$domain = "go-lab.jp"

# Nested ESXi Hostname Fixed List
$vc_hv_name_use_fqdn = $true # $true or $false
$nest_hv_hostname_list = 1..$vm_num | % {
    $nest_hv_hostname_prefix + ($hv_ip_4oct_start + $_ - 1).ToString("00") + "." + $domain
}

# Nested ESXi Network setting
$hv_ip_prefix_vmk0 = "192.168.10." # $hv_ip_prefix_vmk0 + $hv_ip_4oct_start => 192.168.10.111
$hv_vmk0_subnetmask = "255.255.255.0" # /24
$nest_hv_vmk0_vlan = 10 # Default VLAN ID: 0
$hv_gw = "192.168.10.1"

# DNS / NTP Servers
$dns_servers = "192.168.1.101","192.168.1.102"
$ntp_servers = "192.168.1.101","192.168.1.102"

# ----------------------------------------
# Network additional settings (Multi-vmk)

$add_vmk1 = $true # $true or $false
$add_vmk2 = $true # $true or $false

$vmotion_vmk_port = "vmk1"
$vsan_vmk_port = "vmk2"
$witness_vmk_port = "vmk0" # vSAN WTS only

$vmk1_vss = "vSwitch0"
$vmk1_pg = "pg_vmk_vmotion"
$vmk1_vlan = 1001
$vmk1_ip_prefix = "10.0.1." # $hv_ip_prefix_vmk1 + $hv_ip_4oct_start => 10.0.1.31
$vmk1_subnetmask = "255.255.255.0" # /24

$vmk2_vss = "vSwitch0"
$vmk2_pg = "pg_vmk_vsan"
$vmk2_vlan = 1002
$vmk2_ip_prefix = "10.0.2." # $hv_ip_prefix_vmk2 + $hv_ip_4oct_start => 10.0.2.31
$vmk2_subnetmask = "255.255.255.0" # /24

# ----------------------------------------
# Network additional settings (Multi-pNIC)

$multi_vmnic = 4 # add vmnic1 .. vmnic3

# ----------------------------------------
# Storage Settings (vSAN)

# vSAN Datastore Name
$vsan_ds_name = "vsanDatastore-01"

# vSAN Architecture
$vsan_arch = "OSA" # OSA or ESA

# vSAN OSA Disk settings
$vsan_dg_type = "AllFlash"          # OSA only, Hybrid or AllFlash
$vsan_cache_disk_size_gb = 20     # OSA only
$vsan_capacity_disk_size_gb = 200 # OSA only
$vsan_capacity_disk_count = 1     # OSA only
$vsan_dg_count = 1                # OSA only, Multi-Diskgroup setup

# vSAN ESA Disk settings
$nvme_vmdk_size_gb = 200 # ESA only
$nvme_vmdk_count = 2     # ESA only
