# Prometheus libvirt exporter

 - `Dockerfile` - creates a docker container with dynamically linked libvirt-exporter. Make an image and run with `docker container run -p9177:9177 -v /var/run/libvirt:/var/run/libvirt yourcontainername`. Based on the latest golang:alpine.
 - `build-with` - builds dynamically linked libvirt-exporter in the container based on Dockerfile specified as an argument. Ex.: `build-with ./build_container/Dockerfile.ubuntu2004` will build libvirt-exporter for Ubuntu 20.04.

# Metrics
The following metrics/labels are being exported:

```
libvirt_domain_block_meta{bus="scsi",cache="none",discard="unmap",disk_type="network",domain="instance-00000337",driver_type="raw",serial="5f1a922c-e4b5-4020-9308-d70fd8219ac8",source_file="somepool/volume-5f1a922c-e4b5-4020-9308-d70fd8219ac8",target_device="sda"} 1
libvirt_domain_block_stats_allocation{domain="instance-00000337",target_device="sda"} 2.1474816e+10
libvirt_domain_block_stats_capacity_bytes{domain="instance-00000337",target_device="sda"} 2.147483648e+10
libvirt_domain_block_stats_flush_requests_total{domain="instance-00000337",target_device="sda"} 5.153142e+06
libvirt_domain_block_stats_flush_time_seconds_total{domain="instance-00000337",target_device="sda"} 473.56850521
libvirt_domain_block_stats_limit_burst_length_read_requests_seconds{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_length_total_requests_seconds{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_length_write_requests_seconds{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_read_bytes{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_read_bytes_length_seconds{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_read_requests{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_total_bytes{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_total_bytes_length_seconds{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_total_requests{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_write_bytes{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_write_bytes_length_seconds{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_burst_write_requests{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_read_bytes{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_read_requests{domain="instance-00000337",target_device="sda"} 640
libvirt_domain_block_stats_limit_total_bytes{domain="instance-00000337",target_device="sda"} 1.572864e+08
libvirt_domain_block_stats_limit_total_requests{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_write_bytes{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_limit_write_requests{domain="instance-00000337",target_device="sda"} 320
libvirt_domain_block_stats_physicalsize_bytes{domain="instance-00000337",target_device="sda"} 2.147483648e+10
libvirt_domain_block_stats_read_bytes_total{domain="instance-00000337",target_device="sda"} 1.7704034304e+11
libvirt_domain_block_stats_read_requests_total{domain="instance-00000337",target_device="sda"} 1.9613982e+07
libvirt_domain_block_stats_read_time_seconds_total{domain="instance-00000337",target_device="sda"} 161803.085086353
libvirt_domain_block_stats_size_iops_bytes{domain="instance-00000337",target_device="sda"} 0
libvirt_domain_block_stats_write_bytes_total{domain="instance-00000337",target_device="sda"} 9.2141217792e+11
libvirt_domain_block_stats_write_requests_total{domain="instance-00000337",target_device="sda"} 2.8434899e+07
libvirt_domain_block_stats_write_time_seconds_total{domain="instance-00000337",target_device="sda"} 530522.437009019

libvirt_domain_info_cpu_time_seconds_total{domain="instance-00000337"} 949422.12
libvirt_domain_info_maximum_memory_bytes{domain="instance-00000337"} 8.589934592e+09
libvirt_domain_info_memory_usage_bytes{domain="instance-00000337"} 8.589934592e+09
libvirt_domain_info_meta{domain="instance-00000337",flavor="someflavor-8192",instance_name="name.of.instance.com",project_name="instance.com",project_uuid="3051f6f46d394ab98f55a0670ae5c70b",root_type="image",root_uuid="155e5ab9-d28c-48f2-bd8d-f193d0a6128a",user_name="master_admin",user_uuid="240270fa2a3e4fd3baa6d6e776669b19",uuid="1bac351f-242e-4d53-8cf3-fd91b061069c"} 1
libvirt_domain_info_virtual_cpus{domain="instance-00000337"} 2
libvirt_domain_info_vstate{domain="instance-00000337"} 1

libvirt_domain_interface_meta{domain="instance-00000337",source_bridge="br-int",target_device="tapa7e2fe95-a7",virtual_interface="a7e2fe95-a7cf-4bec-8180-d835cf342d72"} 1
libvirt_domain_interface_stats_receive_bytes_total{domain="instance-00000337",target_device="tapa7e2fe95-a7"} 7.9182281e+09
libvirt_domain_interface_stats_receive_drops_total{domain="instance-00000337",target_device="tapa7e2fe95-a7"} 0
libvirt_domain_interface_stats_receive_errors_total{domain="instance-00000337",target_device="tapa7e2fe95-a7"} 0
libvirt_domain_interface_stats_receive_packets_total{domain="instance-00000337",target_device="tapa7e2fe95-a7"} 4.378193e+06
libvirt_domain_interface_stats_transmit_bytes_total{domain="instance-00000337",target_device="tapa7e2fe95-a7"} 1.819996331e+09
libvirt_domain_interface_stats_transmit_drops_total{domain="instance-00000337",target_device="tapa7e2fe95-a7"} 0
libvirt_domain_interface_stats_transmit_errors_total{domain="instance-00000337",target_device="tapa7e2fe95-a7"} 0
libvirt_domain_interface_stats_transmit_packets_total{domain="instance-00000337",target_device="tapa7e2fe95-a7"} 2.275386e+06

libvirt_domain_memory_stats_actual_balloon_bytes{domain="instance-00000337"} 8.589934592e+09
libvirt_domain_memory_stats_available_bytes{domain="instance-00000337"} 8.363945984e+09
libvirt_domain_memory_stats_disk_cache_bytes{domain="instance-00000337"} 0
libvirt_domain_memory_stats_major_fault_total{domain="instance-00000337"} 3.34448e+06
libvirt_domain_memory_stats_minor_fault_total{domain="instance-00000337"} 5.6630255354e+10
libvirt_domain_memory_stats_rss_bytes{domain="instance-00000337"} 8.7020544e+09
libvirt_domain_memory_stats_unused_bytes{domain="instance-00000337"} 7.72722688e+08
libvirt_domain_memory_stats_usable_bytes{domain="instance-00000337"} 2.27098624e+09
libvirt_domain_memory_stats_used_percent{domain="instance-00000337"} 72.84790881786736

libvirt_domain_vcpu_cpu{domain="instance-00000337",vcpu="0"} 7
libvirt_domain_vcpu_delay_seconds_total{domain="instance-00000337",vcpu="0"} 880.985415109
libvirt_domain_vcpu_state{domain="instance-00000337",vcpu="0"} 1
libvirt_domain_vcpu_time_seconds_total{domain="instance-00000337",vcpu="0"} 315190.41
libvirt_domain_vcpu_wait_seconds_total{domain="instance-00000337",vcpu="0"} 0

libvirt_up 1
```

## Libvirt/qemu version notice
Some of the above might be exposed only with:

`libvirt >= v7.2.0`:
libvirt_domain_vcpu_delay_seconds_total

# Historical
Project forked from https://github.com/kumina/libvirt_exporter and substantially rewritten.
Implemented support for several additional metrics, ceph rbd (and network block devices), ovs.
Implemented statistics collection using GetAllDomainStats

And then forked again from https://github.com/rumanzo/libvirt_exporter_improved and rewritten.
Implemented meta metrics and more info about disks, interfaces and domain.

This repository provides code for a Prometheus metrics exporter
for [libvirt](https://libvirt.org/). This exporter connects to any
libvirt daemon and exports per-domain metrics related to CPU, memory,
disk and network usage. By default, this exporter listens on TCP port
9177.

This exporter makes use of
[libvirt-go](https://gitlab.com/libvirt/libvirt-go-module), the official Go
bindings for libvirt. This exporter make use of the
`GetAllDomainStats()`

