resource "aws_security_group" "ec2-sg" {
  name        = "test-sg"
  description = "EC2 Security Group"
  vpc_id      = var.vpc_id

  # SSH rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS rule
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# resource "aws_instance" "private_m1" {
#   for_each = length(var.server_name) > 0 ? var.server_name : null

#   ami             = "ami-0fc5d935ebf8bc3bc"
#   subnet_id       = var.private_subnet
#   key_name        = var.keypair
#   instance_type   = var.instance_type
#   security_groups = [aws_security_group.ec2-sg.id]
#   # iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
#   root_block_device {
#     volume_size = 8
#     volume_type = "gp3"
#     encrypted   = true
#   }
#   tags = {
#     Name  = each.value
#     Owner = "adex"

#   }
# }
resource  "aws_instance" "public_m1" {
    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = var.instance_type
    subnet_id = var.public_subnet
    key_name = var.keypair
    security_groups = [aws_security_group.ec2-sg.id]
    # iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        encrypted = true
    }
tags ={
    Name = "web-tier"
    Owner = "adex"

}
}

resource  "aws_instance" "private_instance" {
    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = var.instance_type
    subnet_id = var.private_subnet1
    key_name = var.keypair
    security_groups = [aws_security_group.ec2-sg.id]
    # iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        encrypted = true
    }
tags ={
    Name = "private-instance"
    Owner = "adex"

}
}
resource  "aws_instance" "private_rds" {
    ami = "ami-0fc5d935ebf8bc3bc"
    instance_type = var.instance_type2
    subnet_id = var.private_subnet2
    key_name = var.keypair
    security_groups = [aws_security_group.ec2-sg.id]
    # iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
    root_block_device {
        volume_size = 8
        volume_type = "gp3"
        encrypted = true
    }
tags ={
    Name = "rds-instance"
    Owner = "adex"

}
}
