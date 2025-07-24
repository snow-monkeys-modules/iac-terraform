output "load_balancer_ip" {
  value = data.civo_loadbalancer.traefik_lb.public_ip
  //value = civo_loadbalancer.traefik_lb.ip_address
  description = "The IP address of the load balancer for the Traefik ingress controller."
}