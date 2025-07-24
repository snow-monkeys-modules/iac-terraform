terraform {

  required_version = ">= 0.13.0"

  required_providers {
    civo = {
      source  = "civo/civo"
      version = "~> 1.1.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.16.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

data "civo_kubernetes_cluster" "k8s_demo_1" {
  depends_on = [
    civo_kubernetes_cluster.k8s_demo_1
  ]
  name = "k8s_demo_1"
}


provider "civo" {
  token = var.civo_token

  # TODO: (optional) change region to your desired datacenter location
  # ---
  # region = "FRA1"
}

provider "helm" {
  kubernetes {
    host                   = yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).clusters.0.cluster.server
    client_certificate     = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).users.0.user.client-certificate-data)
    client_key             = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).users.0.user.client-key-data)
    cluster_ca_certificate = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).clusters.0.cluster.certificate-authority-data)
  }
}

provider "kubernetes" {
  host                   = yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).clusters.0.cluster.server
  client_certificate     = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).users.0.user.client-certificate-data)
  client_key             = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).users.0.user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).clusters.0.cluster.certificate-authority-data)
}

provider "kubectl" {
  host                   = yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).clusters.0.cluster.server
  client_certificate     = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).users.0.user.client-certificate-data)
  client_key             = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).users.0.user.client-key-data)
  cluster_ca_certificate = base64decode(yamldecode(data.civo_kubernetes_cluster.k8s_demo_1.kubeconfig).clusters.0.cluster.certificate-authority-data)
  load_config_file       = false
}
