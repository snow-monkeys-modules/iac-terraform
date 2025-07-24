variable "namespace" {
  type = string
  default = "default"
}

variable "name" {
  type = string
  default = "no-name"
  
}

variable "repository" {
  type = string
  default = "default"
}

variable "chart" {
  type = string
  default = "default"
}

variable "values" {
  type = string
  default = ""
}

variable "civo_token" {
  type = string
  //sensitive = true
}