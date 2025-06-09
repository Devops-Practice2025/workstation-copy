resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "my_subnet" {
   vpc_id = aws_vpc.my_vpc.id
 cidr_block = "10.0.1.0/24"
 map_public_ip_on_launch = true
 tags = {
 Name = "my_subnet"
 }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.my_vpc.id
 tags = {
 Name = "main-gw"
 }
}

# Route Table
resource "aws_route_table" "public" {
 vpc_id = aws_vpc.my_vpc.id
 route {
 cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.gw.id
 }
 tags = {
 Name = "public-rt"
 }
}

# Route Table Association
resource "aws_route_table_association" "a" {
 subnet_id = aws_subnet.my_subnet.id
 route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "Security group with all ports open"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_sg"
  }
}
