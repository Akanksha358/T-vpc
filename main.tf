module "networking"{
    source ="./networking"
    vpc_cidr_in_networkingmodule = var.vpc_cidr
    vpc_name_in_networkingmodule = var.vpc_name
    publicsub_cidr = var.pubsub_cidr
    az_subnets =  var.subnet_az
    pubsubnet_name= var.pubsub_name
    privatesub_cidr = var.prisub_cidr
    privatesubnet_name = var.prisub_name
    igw_name = var.name_of_igw
    rt_names = var.name_of_rt
}
module "ec2" {
    source = "./ec2"
    vpc_id  = module.networking.vpc_id           
    public_subnet_id = module.networking.public_subnet_id 
    private_subnet_id = module.networking.private_subnet_id
    public_ec2_public_key = var.public_ec2instance_public_key
    private_ec2_public_key = var.private_ec2instance_public_key
    ami_id = var.ec2_ami
    instance_type=var.type_of_ec2_instance
}
#outputs
output "vpc_id" {
  value = module.networking.vpc_id
}
output "vpc_cidr_block" {
  value = module.networking.vpc_cidr_block
}

output "public_subnet_id" {
  value = module.networking.public_subnet_id
}

output "private_subnet_id" {
  value = module.networking.private_subnet_id
}

output "nat_gateway_id" {
  value = module.networking.nat_gateway_id
}

# output "nat_eip_public_ip" {
#   value = module.networking.nat.public_ip
# }

output "public_route_table_id" {
  value = module.networking.public_route_table_id
}

output "private_route_table_id" {
  value = module.networking.private_route_table_id
}
#EC2 
output "public_ec2_id" {
  value = module.ec2.public_ec2_id
}

output "public_ec2_public_ip" {
  value =  module.ec2.public_ec2_public_ip
}

output "private_ec2_id" {
  value =  module.ec2.private_ec2_id
}

output "private_ec2_private_ip" {
  value =  module.ec2.private_ec2_private_ip
}

output "public_sg_id" {
  value =  module.ec2.public_sg_id
}

output "private_sg_id" {
  value =  module.ec2.private_sg_id
}

output "public_key_name" {
  value =  module.ec2.public_key_name
}

output "private_key_name" {
  value =  module.ec2.private_key_name
}
output "vpc_name"{
  value = module.networking.vpc_name
}
output "public_subnet_name"{
  value = module.networking.public_subnet_name
}
output "private_subnet_name"{
  value = module.networking.private_subnet_name
}
output "pub_rt_name"{
  value = module.networking.pub_rt_name
}
output "private_rt_name"{
  value = module.networking.private_rt_name
}