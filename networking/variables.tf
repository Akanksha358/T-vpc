variable vpc_cidr_in_networkingmodule{
    type = string
}
variable vpc_name_in_networkingmodule{
    type = string 
}

#PUBLIC SUBNET
variable publicsub_cidr{
    type = string
}
variable az_subnets{
    type = list(string)
}
variable pubsubnet_name{
    type = string 
}

#PRIVATE SUBNET
variable privatesub_cidr{type = string}
variable privatesubnet_name{type = string}
#igw
variable igw_name{type = string}
#pub rt
variable rt_names {type = list(string)}