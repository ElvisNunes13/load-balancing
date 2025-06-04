variable "authentication" {
  type = object({
    assume_role_arn = string
    region = string
  })

  default = {
    region = "us-west-1"
    assume_role_arn = "arn:aws:iam::123456789012:role/ARN-ROLE-NAME"
  }
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project = "project-name"
  }
}
variable "vpc" {
  type = object({
    name = string
    cidr_block = string
    internet_gateway = string
    public_route_table_name = string
    pribate_route_table_name = string
    nat_gateway_name = string
    public_subnets = list(object({
        vpc_id     = string
        cidr_block = string
        availability_zone = string
        map_public_ip_on_launch = bool 
    }))
    private_subnets = list(object({
        vpc_id     = string
        cidr_block = string
        availability_zone = string
        map_public_ip_on_launch = bool 
    }))
  })

  default = {
    name = "vpc-name"
    cidr_block = "10.0.0.0/24"
    internet_gateway = "internet_gateway-name"
    public_route_table_name = "route-public-table-name"
    pribate_route_table_name = "route-private-table-name"
    nat_gateway_name = "nat_gateway_name"
    public_subnets = [ {
        vpc_id     = "subnet-public-name1"
        cidr_block = "10.0.0.0/26"
        availability_zone = "us-west-1a"
        map_public_ip_on_launch = true
    },
    {
        vpc_id     = "subnet-public-name2"
        cidr_block = "10.0.0.64/26"
        availability_zone = "us-west-1c"
        map_public_ip_on_launch = true
    }  ]

    private_subnets = [ {
        vpc_id     = "subnet-private-name1"
        cidr_block = "10.0.0.128/26"
        availability_zone = "us-west-1a"
        map_public_ip_on_launch = false
    },
    {
        vpc_id     = "subnet-private-name2"
        cidr_block = "10.0.0.192/26"
        availability_zone = "us-west-1c"
        map_public_ip_on_launch = false
    }  ]
  }
}