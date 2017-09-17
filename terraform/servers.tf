resource cloudstack_instance "default" {
  name             = "default"
  service_offering = "light.S1"
  network_id       = "${var.network_id}"
  template         = "CentOS 7.3 64-bit"
  keypair          = "${var.keypair_name}"
  zone             = "${var.network_name}"
  expunge          = true
}

resource cloudstack_disk "default" {
  name               = "additional-disk"
  attach             = true
  disk_offering      = "Custom Disk"
  size               = 30
  virtual_machine_id = "${cloudstack_instance.default.id}"
  zone               = "${var.network_name}"
}
