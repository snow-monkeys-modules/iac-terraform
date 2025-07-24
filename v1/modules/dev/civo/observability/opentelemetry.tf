resource "kubernetes_namespace" "helmnamespace" {

  metadata {
    name = var.namespace
  }

}

resource "helm_release" "helmrelease" {
    depends_on = [
        kubernetes_namespace.helmnamespace
    ]
    
    name      = var.name
    namespace = var.namespace
    
    repository = var.repository
    chart      = var.chart
    
    values = [ var.values ]
  
}