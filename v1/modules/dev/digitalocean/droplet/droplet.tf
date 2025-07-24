# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image    = var.droplet_image
  name     = var.droplet_name
  region   = var.region
  size     = var.droplet_size
}

