variable "civo-token" {
  type = string
  sensitive = true
}

variable "name" {
  type = string
  default = "k8s_demo_1"
}

variable "node-count" {
  type = number
  default = 2
}

variable "node-size" {
  type = string
  default = "g4s.kube.medium"
}

/*variable "organization" {
  type = string
  default = "k8s-civo"
}

variable "workspaces" {
  type = string
  default = "k8s-civo"
}*/

variable "region" {
  type = string
  default = "NYC1"
}