variable vpc_cidr{
    type = string
}
variable vpc_name{
    type = string
}
#PUBLIC SUBNET
variable pubsub_cidr{
    type = string
}
variable subnet_az{
    type = list(string)
}
variable pubsub_name{
    type = string 
}
#private subnet

variable prisub_cidr{
    type = string
}
variable prisub_name{
    type = string 
}
variable name_of_igw{
    type = string 
}
variable name_of_rt { type = list(string) }

#key pair ec2
# variable public_ec2instance_public_key {
#     type = string 
# }
# variable private_ec2instance_public_key{
#     type = string 
# }
#ec2 instances
variable ec2_ami{
    type = string 
}
variable type_of_ec2_instance{
    type = string 
}
#RDS
variable "db_identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_instance_class" {
  type = string
}