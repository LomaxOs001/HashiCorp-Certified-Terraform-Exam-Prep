#create network in a custom subnet mode
resource "google_compute_network" "vpc_network" {
  name                                      = "var.vpc_name"
  description                               = "VPC network for the project"   
  auto_create_subnetworks                   = false
  routing_mode                              = "GROBAL"
}

resource "google_compute_subnetwork" "private_subnet" { 
    for_each                                = var.private_subnets 

    name                                    = each.key 
    description                             = "Private subnet for the project"
    ip_cidr_range                           = each.value.cidr 
    region                                  = each.value.region 
    network                                 = google_compute_network.vpc_network.id 
    private_ip_google_access                = true #Access to private google services within this subnet
    depends_on = [ google_compute_network.vpc_network ]

} 

resource "google_compute_subnetwork" "public_subnet" { 
    for_each                                = var.public_subnets 

    name                                    = each.key 
    description                             = "Public subnet for the project"
    ip_cidr_range                           = each.value.cidr 
    region                                  = each.value.region 
    network                                 = google_compute_network.vpc_network.id 
    depends_on = [ google_compute_network.vpc_network ]
}