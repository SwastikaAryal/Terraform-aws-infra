module "ec2-1" {
  source  = "./modules/ec2"
  # ami_id = "ami-0a695f0d95cefc163"
  instance_type = "t2.micro"
  vpc_id = module.vpc.vpc_id
  private_subnet1 = module.vpc.private_subnet[0]
}

# module "ec2-hp" {
#   source  = "./modules/ec2"
#   # ami_id = "ami-0a695f0d95cefc163"
#   instance_type = "t2.micro"
#   vpc_id = module.vpc.vpc_id
#   private_subnet2 = module.vpc.private_subnet[1]
# }

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr                    ="10.0.0.0/16"
    public_subnet1              ="10.0.1.0/24"
    public_subnet2              ="10.0.0.0/24"
    private_subnet1             ="10.0.2.0/24"
    private_subnet2             ="10.0.3.0/24"
    
 }

##########################################################################################
#######################################  For ASG , ELB  #################################
##########################################################################################




 module "elb" {
  source = "./modules/elb"
  # security_groups               = module.ec2.security_group
  public_subnet1                = module.vpc.public_subnet[0]
  public_subnet2                = module.vpc.public_subnet[1]
  vpc_id                        = module.vpc.vpc_id
  # private1_ec2                   = module.ec2.private1_ec2
  # private2_ec2                   = module.ec2.private2_ec2
 }

 module "autoscaling" {
  source = "./modules/autoscaling"
  security_groups = module.elb.security_group
  desired_capacity = 2
  max_size = 4
  min_size = 2
  subnet_id = module.vpc.public_subnet
  # subnet_id = module.vpc.private_subnet
  target_group_arn= module.elb.target_group_arn
  # elb_id =  module.elb.elb_id
  lb_subnets = module.vpc.private_subnet
}



###########################################################################################
########################################  For Cloudfront  #################################
###########################################################################################

# module "s3_website" {
#   source = "./modules/s3_cloudfront"
# }