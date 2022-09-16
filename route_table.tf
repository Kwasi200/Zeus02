

# public route table
resource "aws_route_table" "Test-pub-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

 
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.Test-igw.id

  }
  tags = {
    Name = "Test-pub-route-table"
  }
}



# Creating a Route Table for the Nat Gateway!
resource "aws_route_table" "Test-priv-route-table" {
  depends_on = [aws_nat_gateway.Test-Nat-gateway]

  vpc_id =  aws_vpc.Prod-rock-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Test-Nat-gateway.id
  }

  tags = {
    Name = "Route Table for NAT Gateway"
  }

}





#route association public

resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.Test-public-sub2.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

#route association private

resource "aws_route_table_association" "private_route_table_association_1" {
  subnet_id      = aws_subnet.Test-priv-sub1.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

resource "aws_route_table_association" "private_route_table_association_2" {
  subnet_id      = aws_subnet.Test-priv-sub2.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}