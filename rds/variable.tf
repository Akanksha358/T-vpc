variable "vpc_id" {
  type = string
}

variable "private_ec2_sg_id"{
    type = string
}
variable "subnet_ids" {
  type = list(string)
}
#RDS
variable "db_instance_class" {
  type = string
}
variable "rds_instance_identifier" {
  type = string
}
variable "db_name" {
  type = string
}
variable "db_user" {
  type = string
}