variable "vpc-cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "Name" {
  type    = string
  default = "testing"
}

variable "env" {
}
variable "team" {
}
variable "public-cidr" {
  default = "10.20.0.0/24"
}

variable "private-cidr" {
  default = "10.20.1.0/24"
}
