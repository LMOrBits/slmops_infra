output "instance_ips" {
  value = {
    for name, instance in google_compute_instance.vm : name => instance.network_interface[0].access_config[0].nat_ip
  }
}
