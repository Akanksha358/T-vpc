# variable public_ec2_public_key{
#     type = string 
# }
# variable private_ec2_public_key{
#     type = string 
# }
variable ami_id {
    type = string
}
variable instance_type {
    type = string
}
variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}