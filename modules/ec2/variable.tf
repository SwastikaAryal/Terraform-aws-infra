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
variable "private_subnet" {
}
# variable "private_subnet2" {
# } 