variable "digitalocean_token" { }

variable "name"               { }

variable "image"              { default = "coreos-stable" }
variable "region"             { default = "nyc1" }
variable "size"               { default = "512mb" }
variable "private_networking" { default = "true" }

variable "ssh_key_name" { }

variable "nginx_version" { default = "1.9.7" }

