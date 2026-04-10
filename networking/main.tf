resource "aws_vpc""terraform_vpc"{
    cidr_block = var.vpc_cidr_in_networkingmodule
    tags = {
        Name = var.vpc_name_in_networkingmodule
        }
    }
#PUBLIC SUBNET
resource "aws_subnet" "public_subnet"{
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = var.publicsub_cidr
    availability_zone = var.az_subnets[0]
    tags = {
        Name = var.pubsubnet_name
    }
}
#PRIVATE SUBNET
resource "aws_subnet" "private_subnet"{
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = var.privatesub_cidr
    availability_zone = var.az_subnets[1]
    tags = {
        Name = var.privatesubnet_name
    }
}
#IGW
resource "aws_internet_gateway" "internet-gateway"{
    vpc_id = aws_vpc.terraform_vpc.id
    tags = {
        Name = var.igw_name
}
}
#PUBLIC ROUTETABLE
resource "aws_route_table" "public_rt"{
    vpc_id = aws_vpc.terraform_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gateway.id
    }
    tags = {
        Name = var.rt_names[0]
    }

}
#PUBLIC ROUTETABLE ASSOCIATION
resource "aws_route_table_association" "public_rt_association"{
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}
#PRIVATE ROUTETABLE
resource "aws_route_table" "private_rt"{
    vpc_id = aws_vpc.terraform_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }
    tags = {
        Name = var.rt_names[1]
    }

}
#PRIVATE ROUTETABLE ASSOCIATON
resource "aws_route_table_association" "private_rt_association"{
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_rt.id
}

#NAT 
resource "aws_eip" "nat" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.internet-gateway]

  tags = {
    Name = "nat-eip"
  }
}

# NAT GATEWAY - placed in PUBLIC subnet
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.id      # your public subnet name

  depends_on = [aws_internet_gateway.internet-gateway]  # your IGW name

  tags = {
    Name = "nat-gateway"
  }
}