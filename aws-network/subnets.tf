resource "aws_subnet" "public_subnet" {
    count = var.public_subnet_count
    vpc_id = aws_vpc.this.id
    cidr_block = "${cidrsubnet(var.vpc_cidr,8,count.index)}"
    availability_zone = "${var.region}${lookup(var.az_number, count.index)}"

    tags = {
        Name = "pubsub-${count.index}"
    }
}

resource "aws_subnet" "private_subnet" {
    count = var.private_subnet_count
    vpc_id = aws_vpc.this.id
    cidr_block = "${cidrsubnet(var.vpc_cidr,8,count.index + var.public_subnet_count)}"
    availability_zone = "${var.region}${lookup(var.az_number, count.index)}"

    tags = {
        Name = "pvtsub-${count.index}"
    }
}

data "aws_subnets" "private" {
 tags = {
    Name = "pvt*"
  }

  depends_on = [ aws_subnet.private_subnet ]
}

data "aws_subnets" "public" {
 tags = {
    Name = "pub*"
  }

  depends_on = [ aws_subnet.public_subnet ]
}