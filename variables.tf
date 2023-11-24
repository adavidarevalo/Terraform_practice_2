variable "region" {
    type = string
    default = "us-east-2"
}

variable "vpc_cidr" {
    type = string
    default = "192.168.0.0/16"
}
variable "subnet_cidr" {
    type = list(string)
    default = ["192.168.1.0/24", "192.168.2.0/24","192.168.3.0/24"]
}

variable "azs" { 
    type = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

# data "aws_availability_zone" "azs" {}