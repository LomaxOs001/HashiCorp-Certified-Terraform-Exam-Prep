output "vpc_name" { 
    description = "The name of the VPC" 
    value = google_compute_network.vpc_network.name 
} 

output "private_subnet_names" { 
    description = "The private names of the subnets" 
    value =  keys(var.private_subnets)
}

output "public_subnet_names" { 
    description = "The public names of the subnets" 
    value =  keys(var.public_subnets)
}