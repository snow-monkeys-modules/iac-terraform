# Cloudflare DNS records and API Secret

resource "kubernetes_secret" "cloudflare_api_key_secret" {

    depends_on = [
        kubernetes_namespace.certmanager
    ]

    metadata {
        name = "cloudflare-api-key-secret"
        namespace = "certmanager"
    }

    data = {
        api-key = var.cloudflare_api_key
    }

    type = "Opaque"
}


resource "cloudflare_record" "clcreative-all-cluster" {
    zone_id = var.cloudflare_zone_id
    name = var.cloudflare_record_name
    value =  data.civo_loadbalancer.traefik_lb.public_ip
    type = "A"
    proxied = false
}