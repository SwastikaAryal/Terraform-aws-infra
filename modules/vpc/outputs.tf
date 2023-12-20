
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet" {
  value = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
}

output "private_subnet" {
  value = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id, aws_subnet.private_subnet3.id, aws_subnet.private_subnet4.id]
}
output "private_subnet1" {
  value = aws_subnet.private_subnet1.id
}
output "private_subnet2" {
  value = aws_subnet.private_subnet2.id
}
output "private_subnet3" {
  value = aws_subnet.private_subnet3.id
}
output "private_subnet4" {
  value = aws_subnet.private_subnet4.id
}
