vpc_cidr = "10.0.0.0/24"
vpc_name = "t-vpc"
#PUBLIC SUBNET 
pubsub_cidr= "10.0.0.0/25"
subnet_az = ["ap-south-1a", "ap-south-1b"]
pubsub_name = "T-publicsubnet"
#private subnet
prisub_cidr = "10.0.0.128/25"
prisub_name = "T-privatesubnet"
#igw
name_of_igw = "T-IGW"
#rts
name_of_rt = ["T-public-rt","T-private-rt"]

ec2_ami = "ami-045443a70fafb8bbc"
type_of_ec2_instance ="t3.micro"

#RDS
db_identifier     = "t-rds-instance"
db_name           = "mytestdb"
db_username       = "admin"
db_instance_class = "db.t3.micro"