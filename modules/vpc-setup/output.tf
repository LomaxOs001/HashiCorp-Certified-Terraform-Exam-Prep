output "vpc_name" { 
    description = "The name of the VPC" 
    value = google_compute_network.vpc_network.name 
} 

output "subnet_names" { 
    description = "The names of the subnets" 
    value = [for subnet in google_compute_subnetwork.private_subnet : subnet.name] + [for subnet in google_compute_subnetwork.public_subnet : subnet.name] 
}