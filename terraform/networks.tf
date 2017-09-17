resource cloudstack_firewall "default" {
  ip_address_id = "${var.ip_address_id}"

  rule {
    cidr_list = ["0.0.0.0/0"]
    protocol  = "tcp"
    ports     = ["80", "443"]
  }
}

resource cloudstack_port_forward "default" {
  ip_address_id = "${var.ip_address_id}"

  forward {
    protocol           = "tcp"
    private_port       = 80
    public_port        = 80
    virtual_machine_id = "${cloudstack_instance.default.id}"
  }

  forward {
    protocol           = "tcp"
    private_port       = 443
    public_port        = 443
    virtual_machine_id = "${cloudstack_instance.default.id}"
  }
}
