output "vpc_id" {
  value = aws_vpc.Prod-rock-VPC.id
}


output "vpc_public_subnet_1" {
  description = "IDs of the VPC's public subnet-1"
  value       = var.Test-public-sub1
}


output "vpc_public_subnet_2" {
  description = "IDs of the VPC's public subnet-2"
  value       = var.Test-public-sub2
}

output "vpc_private_subnet_1" {
  description = "IDs of the VPC's private subnet_1"
  value       = var.Test-priv-sub1

}

output "vpc_private_subnet_2" {
  description = "IDs of the VPC's private subnet_2"
  value       = var.Test-priv-sub2

 }

output "Elastic_ip"        {
    description = "Elastic Ip"
    value = aws_eip.nat_eip
}

output "public_sg" {
  value = aws_security_group.Test-sec-group.id
}




output "Test-server1-public-ip" {
  description = "Public IP address of the EC2 instance_1"
  value       = aws_instance.Test-server1
}

output "Test-server2-public-ip" {
  value = ["${aws_instance.Test-server2.*.public_ip}"]
}

output "Bastion-public-ip" {
  value = ["${aws_instance.Bastion.*.public_ip}"]
}



/* output "ec2_global_ips" {
  value = ["${aws_instance.Test-server1.*.public_ip}"]
} */
/* output "instance_public_ip" {
  description = "Public IP address of the EC2 instance_2"
  value       = aws_instance.Test-server2 */
 
/* output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.node_2
} */