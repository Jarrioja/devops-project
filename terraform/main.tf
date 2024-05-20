terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "devops-cluster" {
  name    = "devops-cluster"
  region  = "nyc3"
  version = "1.29.1-do.0 "
  node_pool {
    name       = "devops-node-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}
