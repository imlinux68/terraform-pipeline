resource "aws_vpc" "my_vpc" {
	cidr_block = var.vpc_cidr
	enable_dns_hostnames = true
	enable_dns_support = true
	tags = {
		Name = "my_vpc"
	}
}


resource "aws_internet_gateway" "my_igw" {
	vpc_id = aws_vpc.my_vpc.id
	tags = {
		Name = "My_IGW"
	}
}
