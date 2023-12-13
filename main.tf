

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
		Name = "My_IGW"
	}
}
