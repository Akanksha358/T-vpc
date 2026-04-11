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

# output "public_key_name" {
#   value =  module.ec2.public_key_name
# }

# output "private_key_name" {
#   value =  module.ec2.private_key_name
# }
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