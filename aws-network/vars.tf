variable "region" {
    description = "enter aws region"
}

variable "app_name" {
    description = "application name"
}

variable "env" {
    description = "environment name. e.g. dev, stg, prod"
}

variable "az_number" {
    default = {
        "0" = "a"
        "1" = "b"
        "2" = "c"
        "3" = "d"
        "4" = "e"
        "5" = "f"
    }
}

variable "vpc_cidr" {
    description = "Please enter the required cidr block for VPC. e.g. 10.0.0.0/16"
}

variable "public_subnet_count" {
    description = "Please enter the desired number of public subnets. Within the available number in the region."
}

variable "private_subnet_count" {
    description = "Please enter the desired number of private subnets. Within the available number in the region."
}

variable "create_nat_gw" {
    description = "is nat gateway require to be created for private subnets?"
    default = false
}

