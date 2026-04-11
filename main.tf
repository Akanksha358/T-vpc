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
    # public_ec2_public_key = var.public_ec2instance_public_key
    # private_ec2_public_key = var.private_ec2instance_public_key
    ami_id = var.ec2_ami
    instance_type=var.type_of_ec2_instance
}
