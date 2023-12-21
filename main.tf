module "ec2" {
  source          = "./modules/ec2"
  instance_type   = "t2.micro"
  vpc_id          = module.vpc.vpc_id
  private_subnet1 = module.vpc.private_subnet2
  private_subnet2 = module.vpc.private_subnet3
  public_subnet   = module.vpc.public_subnet[0]
}
module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = "10.0.0.0/16"
  public_subnet1  = "10.0.1.0/24"
  public_subnet2  = "10.0.0.0/24"
  private_subnet1 = "10.0.2.0/24"
  private_subnet2 = "10.0.3.0/24"
  private_subnet3 = "10.0.4.0/24"
  private_subnet4 = "10.0.5.0/24"

}


##########################################################################################
#######################################  RDS #################################
##########################################################################################
module "rds" {
  source         = "./modules/rds"
  instance_class = "db.t2.micro"
  storage        = "20"
  engine_type    = "mysql"
  engine_version = "5.7"
  db_user_name   = "hamropatro"
  db_password    = "hamropatro"
  vpc_id         = module.vpc.vpc_id
  security_group = module.ec2.security_group
  private_subnet = module.vpc.private_subnet
}

# ##########################################################################################
# #######################################  For ASG , ELB  #################################
# ##########################################################################################

# module "elb" {
#   source = "./modules/elb"
#   # security_groups               = module.ec2.security_group
#   public_subnet1 = module.vpc.public_subnet[0]
#   public_subnet2 = module.vpc.public_subnet[1]
#   vpc_id         = module.vpc.vpc_id
# }

# module "autoscaling" {
#   source           = "./modules/autoscaling"
#   security_groups  = module.elb.security_group
#   desired_capacity = 2
#   max_size         = 4
#   min_size         = 2
#   subnet_id        = module.vpc.public_subnet
#   target_group_arn = module.elb.target_group_arn
#   lb_subnets       = module.vpc.private_subnet
# }
