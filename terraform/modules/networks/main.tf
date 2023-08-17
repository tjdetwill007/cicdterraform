#VPC

resource "aws_vpc" "myserverVPC" {
        cidr_block       = var.cidrBlock
        instance_tenancy = "default"

        tags             = {
            Name = var.vpc_name
         }
  }

#PUBLIC SUBNET

resource "aws_subnet" "myserverPublicSubnet" {
  vpc_id     = aws_vpc.myserverVPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availabilityzonePublic
  map_public_ip_on_launch = true

  tags = {
    Name = "myserverPublicSubnet"
  }
}

#INTERNET GATEWAY

resource "aws_internet_gateway" "myserverinternetgw" {
  vpc_id = aws_vpc.myserverVPC.id

  tags = {
    Name = "myserverigw"
  }
}


#ROUTE TABLE

resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.myserverVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myserverinternetgw.id
  }


  tags = {
    Name = "myserverPublicRouteTB"
  }
}

#ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.myserverPublicSubnet.id
  route_table_id = aws_route_table.publicRouteTable.id
}

#SECURITY GROUP

resource "aws_security_group" "mysecuritygp" {
  name   = "myserversecuritygp"
  vpc_id = aws_vpc.myserverVPC.id

    ingress {
    description      = "SSH ALLOW"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
    ingress {
    description      = "HTTP ALLOW"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
}