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
  name                             = "devops-cluster"
  region                           = "nyc3"
  version                          = "1.30.1-do.0"
  destroy_all_associated_resources = true
  node_pool {
    name       = "devops-node-pool"
    size       = "s-2vcpu-4gb"
    node_count = 1
  }
}

output "kubeconfig" {
  value = "doctl kubernetes cluster kubeconfig save ${digitalocean_kubernetes_cluster.devops-cluster.id}"
}
