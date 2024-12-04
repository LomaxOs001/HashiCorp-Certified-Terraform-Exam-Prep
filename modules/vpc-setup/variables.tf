variable "vpc_name" {
    type = string
    default = "vpc-terraform"
}

variable "private_subnets" {
    type = map(object({
        cidr = string
        region = string
    }))
    default = {
        "private-subnet-1" = { cidr = "10.0.1.0/24", region = "us-west1"}
        "private-subnet-2" = { cidr = "10.1.0.0/24", region = "us-central1"}
    }
}

variable "public_subnets" {
    type = map(object({
        cidr = string
        region = string
    }))
    default = {
        "public-subnet-1" = { cidr = "10.0.2.0/24", region = "us-west1"}
        "public-subnet-2" = { cidr = "10.2.0.0/24", region = "us-central1"}
    }
}