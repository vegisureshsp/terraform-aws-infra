variable "env" {
    
    description = "Environment name"
    type = string
    default = "dev"
}

variable "vpc_cidr" {
    description = "VPC CIDR block"
    type = string
    default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
    description = "Public subnet CIDR block"
    type = string
    default = "10.0.1.0/24"
}
variable "public_az" {
    description = "Public subnet AZ"
    type = string
    default = "us-east-1a"
}
