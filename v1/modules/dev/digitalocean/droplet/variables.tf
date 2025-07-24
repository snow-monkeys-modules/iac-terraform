variable "digitalocean_token" {
  type      = string
  sensitive = true
}

variable "region" {
  description = "The region to create resources in"
  type        = string
  default     = "nyc3"
}

variable "droplet_name" {
  description = "Name of the droplet"
  type        = string
  default     = "web-server"
}

variable "droplet_size" {
  description = "Droplet size slug"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "droplet_image" {
  description = "Droplet image slug"
  type        = string
  default     = "ubuntu-22-04-x64"
}
