resource "digitalocean_droplet" "default" {
  name = "${var.name}"

  image              = "${var.image}"
  region             = "${var.region}"
  size               = "${var.size}"
  private_networking = "${var.private_networking}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]

  user_data = "${data.template_file.user_data.rendered}"
}

output "ipv4_address" {
  value = "${digitalocean_droplet.default.ipv4_address}"
}
