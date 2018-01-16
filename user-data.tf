data "template_file" "user_data" {
  template = "${file("user-data.tpl")}"

  vars {
    nginx_version = "${var.nginx_version}"
  }
}
