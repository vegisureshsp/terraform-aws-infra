resource "aws_vpc" "custom_vpc" {
    cidr_block = var.vpc_cider_block

    tages = {
        Name = "${var.env}-vpc"
    }
}

resource ""aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = var.cidr_public_block
    map_public_ip_on_launch = true

    tags = {

        Name = "${vaer.env}-public-subnet"
    }

}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.custom_vpc.id

    tags = {
        Name = "${var.igw}-igw"
    }
}

resoruce "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.custom_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "${var.env}-public-rt"
    }
}

resoruce "aws_route_table_association" "public_rt_association" {

    subnet_id = aws_subnet.public_subnet.id
    route_table = aws_route_table.public_rt.id
}



resource ""aws_subnet" "private_subnet" {

    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = var.cidr_private_block
    map_public_ip_on_launch = false

    tags = {

        Name = "${var.env}-private-subnet"
    }
}


resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.custom_vpc.id

    tags = {
        Name = "${var.env}-private-rt"
    }
}


resource "aws_route_table_association" "private_rt_association" {

    subnet_id = aws_subnet.private_subnet.id
    route_table = aws_route_table.private_rt.id
}

