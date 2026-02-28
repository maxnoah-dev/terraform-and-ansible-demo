variable "do_token" {
  description = "This is token to access to Digital Ocean"
}
variable "ssh_key" {
  description = "This is public to save on VPS to login"
}

terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "2.74.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "setup" {
  name = "vps-demo"
  region = "sgp1"
  size = "s-1vcpu-1gb"
  image = "ubuntu-24-04-x64"
  ssh_keys = [var.ssh_key]
}

output "demo_output" {
  value = { id : digitalocean_droplet.setup.ipv4_address }
}
