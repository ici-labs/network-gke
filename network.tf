module "network" {
    source  = "terraform-google-modules/network/google"
    version = "3.2.2"
    project_id   = var.project_id
    network_name = "example-vpc"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = var.region
        },
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "240.0.0.0/14"
            },
                                    {
                range_name    = "subnet-01-secondary-02"
                ip_cidr_range = "240.4.0.0/20"
            },
        ]
    }
}