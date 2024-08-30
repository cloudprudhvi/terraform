variable "vpc-cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "Name" {
  type    = string
  default = "testing"
}

variable "env" {
  default = "dev"
}
variable "team" {
  default = "devops"
}
variable "public-cidr" {
  default = "10.20.0.0/24"
}

variable "private-cidr" {
  default = "10.20.2.0/24"
}
