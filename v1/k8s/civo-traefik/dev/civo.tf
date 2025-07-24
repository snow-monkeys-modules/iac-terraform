# Kubernetes Cluster

data "civo_size" "medium" {

  # TODO: (optional): change the values according to your desired instance image sizing
  # ---
  filter {
    key      = "name"
    values   = [ var.node-size ]
    match_by = "re"
  }
}

resource "civo_kubernetes_cluster" "k8s_demo_1" {

  name         = var.name
  applications = "argocd"
  firewall_id  = civo_firewall.fw_demo_1.id

  pools {
    size       = element(data.civo_size.medium.sizes, 0).name
    node_count = var.node-count
  }
}

resource "civo_firewall" "fw_demo_1" {
  name                 = "fw_demo_1-firewall"
  create_default_rules = false

  ingress_rule {
    label      = "kubernetes_http"
    protocol   = "tcp"
    port_range = "80"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }

  ingress_rule {
    label      = "kubernetes_https"
    protocol   = "tcp"
    port_range = "443"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }

  ingress_rule {
    label      = "kubernetes_api"
    protocol   = "tcp"
    port_range = "6443"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }
}

resource "time_sleep" "wait_for_kubernetes" {

  depends_on = [
    civo_kubernetes_cluster.k8s_demo_1
  ]

  create_duration = "20s"
}
