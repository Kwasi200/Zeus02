
resource "aws_instance" "Test-server1" {
  ami           = var.amazon_ubuntu
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id                   = aws_subnet.Test-public-sub1.id
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  associate_public_ip_address = true
  availability_zone           = var.AZ-1



  tags = {
    "Name" : "Test-server1"
  }
}

resource "aws_instance" "Bastion" {
  ami           = var.amazon_ubuntu
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id                   = aws_subnet.Test-public-sub2.id
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  associate_public_ip_address = true
  availability_zone           = var.AZ-1



  tags = {
    "Name" : "Bastion"
  }
}


# Create a EC2 Instance (Ubuntu 18)
resource "aws_instance" "Test-server2" {
  instance_type               = "t2.micro" # free instance
  ami                         = var.amazon_ubuntu
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  subnet_id                   = aws_subnet.Test-priv-sub2.id 
  associate_public_ip_address = true 
  availability_zone           = var.AZ-1

  tags = {
    Name = "Test-server2"
  }

  /* user_data = file("${path.root}/ec2/userdata.tpl")

  root_block_device {
    volume_size = 10
  } */
}

/* # Create and assosiate an Elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.node.id
} */

/* resource "aws_instance" "node_2" {
  instance_type          = "t2.micro" # free instance
  ami                    = var.amazon_ubuntu
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.Sec_group.id]
  subnet_id              = aws_subnet.public_subnet1.id 
  associate_public_ip_address = true
  availability_zone      = var.AZ-1

  tags = {
    Name = "EC2_on_public_1"
  }

}

resource "aws_instance" "node_3" {
  instance_type          = "t2.micro" # free instance
  ami                    = var.amazon_linux
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.Sec_group.id]
  subnet_id              = aws_subnet.public_subnet1.id 
  associate_public_ip_address = true
  availability_zone      = var.AZ-1

  tags = {
    Name = "EC2_on_public_2"
  }

} */