#!/bin/bash

# List of VM IP addresses or hostnames
VMS=(
    "192.168.3.86"    # master_ip
    "192.168.3.95"   # worker1_node_ip
    "192.168.3.159"   # worker2_ip
    "192.168.3.102"   # registry_ip
    "192.168.3.145"   # postgres_ip
    "192.168.3.72"   # haproxy_ip
    "192.168.3.139"   # nfs_ip
    "192.168.3.65"   # dns_ip
    "192.168.3.148"   # dns_ip
    "192.168.3.171"   # dns_ip
    "192.168.3.175"   # dns_ip
    "192.168.3.177"   # dns_ip
    "192.168.3.115"   # dns_ip
)

# Function to check if a VM is running
check_vm() {
    local vm_ip=$1
    if ping -c 1 -W 2 "$vm_ip" > /dev/null; then
        echo "$vm_ip is running."
    else
        echo "$vm_ip is not reachable."
    fi
}

# Iterate over each VM in the list and check its status
for vm in "${VMS[@]}"; do
    check_vm "$vm"
done

