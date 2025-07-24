variable "cloudflare_email" {
  type = string
  //sensitive = false
}

variable "cloudflare_api_key" {
  type = string
  //sensitive = true
}

variable "cloudflare_zone_id" {
  type = string 
}

variable "cloudflare_record_name" {
  type = string
  default = "*.connectorsapp.com"
}