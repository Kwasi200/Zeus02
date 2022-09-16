# My





resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "Prod-rock-VPC"
  }
}


# Public subnet1
resource "aws_subnet" "Test-public-sub1" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.Test-public-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = "Test-public-sub1"
  }
}

# Public subnet2
resource "aws_subnet" "Test-public-sub2" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.Test-public-sub2
  availability_zone = var.AZ-1

  tags = {
    Name = "Test-public-sub2"
  }
}

# Private subnet1
resource "aws_subnet" "Test-priv-sub1" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.Test-priv-sub1
  availability_zone = var.AZ-1

  tags = {
    Name = "Test-priv-sub1"
  }
}

# Private subnet2
resource "aws_subnet" "Test-priv-sub2" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.Test-priv-sub2
  availability_zone = var.AZ-1

  tags = {
    Name = "Test-priv-sub2"
  }
}




# internet gateway
resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-igw"
  }
}

# aws route

resource "aws_route" "Test-igw-association" {
  route_table_id         = aws_route_table.Test-pub-route-table.id
  gateway_id             = aws_internet_gateway.Test-igw.id
  destination_cidr_block = var.destination_cidr_block
}

# Elastic Ip
resource "aws_eip" "nat_eip" {
  vpc                       = true
  associate_with_private_ip = "10.0.0.3"
  depends_on                = [aws_internet_gateway.Test-igw]
  tags = {
    Name = "nat_eip"
  }
}


# Nat Gateway

resource "aws_nat_gateway" "Test-Nat-gateway" {
  allocation_id = aws_eip.nat_eip.id
  
  #Associate it with one of the public subnets
  subnet_id     = aws_subnet.Test-public-sub2.id
  # subnet_id      = aws_subnet.public_subnet2.id

  tags = {
    Name = "Test-Nat-gateway"
  }
}




# public EC2 instance
