resource cloudstack_ssh_keypair "dummy" {
  name       = "dummy"
  public_key = "${file("~/.ssh/dummy.pub")}"
}
