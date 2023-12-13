

resource "random_id" "my_rand" {
	byte_length = 2

}

resource "aws_vpc" "my_vpc" {
	cidr_block = var.vpc_cidr
	enable_dns_hostnames = true
	enable_dns_support = true
	tags = {
		Name = "my_vpc-${random_id.my_rand.dec}"
	}
	lifecycle {
	create_before_destroy = true
	}
}


resource "aws_internet_gateway" "my_igw" {
	vpc_id = aws_vpc.my_vpc.id
	tags = {
		Name = "My_IGW-${random_id.my_rand.dec}"
	}
}


resource "aws_route_table" "my_rt" {
	vpc_id = aws_vpc.my_vpc.id
	tags = {
		Name = "MY_RT-${random_id.my_rand.dec}"
	}
}

resource "aws_route" "my_route" {
	route_table_id = aws_route_table.my_rt.id
	destination_cidr_block = "0.0.0.0/0"
	gateway_id = aws_internet_gateway.my_igw.id

}
