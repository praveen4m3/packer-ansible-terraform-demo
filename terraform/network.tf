resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}"

tags = {
    Name = "${var.stack}-vpc"
  }
}

resource "aws_subnet" "subnet" {
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = "${var.subnet_cidr}"
    availability_zone = "${var.avail_zone}"
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.vpc.id}"

    tags = {
     Name = "${var.stack}-igw"
    }
}


resource "aws_route_table" "public" {
     vpc_id = "${aws_vpc.vpc.id}"

     route {
     cidr_block = "0.0.0.0/0"
     gateway_id = "${aws_internet_gateway.igw.id}"
     }

     tags = {
     Name = "${var.stack}-public"
     }
}

resource "aws_route_table_association" "public" {
    route_table_id = "${aws_route_table.public.id}"

    subnet_id = "${aws_subnet.subnet.id}"
}

resource "aws_security_group" "sg" {
      name = "${var.stack}-sg"
      description = "This is for ${var.stack}s security group"
      vpc_id = "${aws_vpc.vpc.id}"
      tags = {
      Name = "${var.stack}-sg"
      }
}

resource "aws_security_group_rule" "rule" {
    count = "${length(var.port_number)}"
    type = "ingress"
    from_port = "${var.port_number[count.index]}"
    to_port = "${var.port_number[count.index]}"
    protocol = "tcp"
    cidr_blocks = "${var.sg_source}"
    security_group_id = "${aws_security_group.sg.id}"
    description = "rule-${count.index} port-${var.port_number[count.index]}"
}
