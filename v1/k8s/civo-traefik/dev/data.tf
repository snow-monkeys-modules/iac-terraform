data "civo_loadbalancer" "traefik_lb" {

  depends_on = [
    helm_release.traefik
  ]

  name = "k8s_demo_1-traefik-traefik"
}