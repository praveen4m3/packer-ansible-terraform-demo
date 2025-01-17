variable region {
    description = "AWS Region"
    default = "ap-south-1"
}

variable "stack" {
    description = "Name of the Stack"
    default = "terraform"
}

variable "vpc_cidr" {
    description = "CIDR of the VPC"
    default = "10.0.0.0/16"
}

variable "subnet_cidr" {
    description = "Subnet CIDR blocks"
    default = "10.0.1.0/24"
}

variable "vm_size" {
    description = "Size of the VM"
    default = "t2.micro"
}



variable "sg_source" {
    default = ["0.0.0.0/0"]
    description = "source cidr for sg"
}

variable "port_number" {
  description = "Remote tcp port to be used for access to the vms created via the nsg applied to the nics."
  default = ["22","8080","80"]
}

variable "avail_zone" {
  default = "ap-south-1a"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}
