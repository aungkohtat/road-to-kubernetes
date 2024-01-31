terraform {
  required_version = ">= 0.15"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_api_token
}

locals {
  root_dir        = abspath(path.root)
  k8s_config_dir  = "${local.root_dir}/.kube/"
  k8s_config_file = "${local.k8s_config_dir}kubeconfig.yaml"
}

variable "digitalocean_api_token" {
  description = "Your DigitalOcean API Personal Access Token. (required)"
  sensitive   = true
}

resource "digitalocean_kubernetes_cluster" "my_cluster" {
  name    = "my-k8s-cluster"
  region  = "sgp1"  # Change this to your desired DigitalOcean region
  version = "1.29.0-do.0"  # Make sure this is a valid version

  node_pool {
    name       = "pool-1"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }

  # Add more node pool blocks if needed
}

resource "local_file" "k8s_config" {
  content          = digitalocean_kubernetes_cluster.my_cluster.kube_config[0].raw_config
  filename         = local.k8s_config_file
  file_permission  = "0600"
}


