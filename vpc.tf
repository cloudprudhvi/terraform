resource "aws_vpc" "test" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "${var.Name}-${var.env}"
    team = "${var.team}"
  }
}

#ctrl+s for saving

resource "aws_subnet" "prudhvi" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.public-cidr

  tags = {
    Name = "${var.Name}-${var.env}-public"
  }
}

resource "aws_subnet" "test" {
  vpc_id     = aws_vpc.test.id
  cidr_block = var.private-cidr

  tags = {
    Name = "${var.Name}-${var.env}-private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.test.id
  tags = {
    Name = "${var.Name}-${var.env}-route"
  }
}

resource "aws_internet_gateway" "this" {
  tags = {
    Name = "${var.Name}-${var.env}-igw"
  }
  vpc_id = aws_vpc.test.id
}

//CTRL+D

# natgateway
# routetable


# MAps
# for_each vs count 
# count
# provisioner 


