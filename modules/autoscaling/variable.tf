variable "key_name" {
    type = string
    default = "adex-hamropatro"
}
variable "image_id" {
    default = "ami-0fc5d935ebf8bc3bc"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "security_groups"{
    description="security group for asg"
}
variable "subnet_id" {
    description = "subnet id for asg template"
}
variable "desired_capacity" {
    description= "Number of desired instance"
}
variable "max_size" {
    description = "number of instance to scale up"
}
variable "min_size" {
    description = "number of instance to scale down"

}
variable "lb_subnets" {
    description = "subnet id of load balancer"
}
variable "target_group_arn" {} 
