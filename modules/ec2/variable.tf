variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "type of instance to deploy"
}
variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC where we will create ec2 instance"
}

variable "keypair" {
  default = "adex-hamropatro"
}
# variable "public_subnet" {} 
# variable "private_subnet" {
# }
# variable "private_subnet2" {
# } 

variable "server_name" {
  description = " name of the servers"
  type        = any
  default = {
    name1 = "hamropatro-server-1",
    name2 = "hamropatro-server-2"
  }
}
##########RDS instance#########
variable "instance_type2" {
  type        = string
  default     = "t2.medium"
  description = "type of instance to deploy"
}
variable "private_subnet1" {
}
variable "private_subnet2" {
}
variable "public_subnet" {
}