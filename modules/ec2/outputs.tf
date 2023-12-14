output "private1_ec2" {
    value = aws_instance.private_m1.id
}
# # output "private2_ec2" {
# #     value = aws_instance.private_m2.id
# # }
# output "private_subnet" {
#   value = aws_subnet.private[*].id
# }

output "security_group" {
    value = aws_security_group.ec2-sg.id 
}