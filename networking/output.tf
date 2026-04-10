output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
}
output "vpc_name"{
  value = aws_vpc.terraform_vpc.tags["Name"]
}
output "vpc_cidr_block" {
  value = aws_vpc.terraform_vpc.cidr_block
}

output "public_subnet_name"{
  value = aws_subnet.public_subnet.tags["Name"]
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_name"{
  value = aws_subnet.private_subnet.tags["Name"]
}
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}


output "pub_rt_name"{
  value = aws_route_table.public_rt.tags["Name"]
}
output "public_route_table_id" {
  value = aws_route_table.public_rt.id
}

output "private_rt_name"{
  value = aws_route_table.private_rt.tags["Name"]
}
output "private_route_table_id" {
  value = aws_route_table.private_rt.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}


output "nat_eip_public_ip" {
  value = aws_eip.nat.public_ip
}




