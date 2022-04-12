
locals {
  project_name = "${var.project_prefix}"
}

resource "aws_vpc" "dp_vpc" {
  cidr_block  = var.cidr_block

  tags = {
    Name = "${local.project_name}-VPC"
  }
}

resource "aws_subnet" "dp_Pub-Subnet" {
  count                   = length(var.PubSubnet_cidr)
  vpc_id                  = aws_vpc.dp_vpc.id
  cidr_block              = var.PubSubnet_cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zone, count.index)

  tags = {
    Name            = "${local.project_name}-${element(var.availability_zone, count.index)}-Pub-Subnet"
  }

}


resource "aws_subnet" "dp_Prv-Subnet" {
  count = length(var.PrvSubnet_cidr)
  vpc_id                  = aws_vpc.dp_vpc.id
  cidr_block              = var.PrvSubnet_cidr[count.index]
  map_public_ip_on_launch = false
  availability_zone       = element(var.availability_zone, count.index)

  tags = {
    Name            = "${local.project_name}-${element(var.availability_zone, count.index)}-Prv-Subnet"
  }

}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dp_vpc.id

  tags = {
    Name            = "${local.project_name}-IGW"
  }

}


resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]


  tags = {
    Name            = "${local.project_name}-eip"
  }
}


resource "aws_nat_gateway" "nat" {
  
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.dp_Pub-Subnet[0].id
  depends_on    = [aws_internet_gateway.igw]


  tags = {
    Name            = "${local.project_name}-NAT"
  }
}



# create route table with inline route specified for the public subnets and attach gateway
resource "aws_route_table" "du_pub-rt" {
  vpc_id = aws_vpc.dp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

   tags = {
    Name = "${local.project_name}-public-rt"
  }
}



# associate all public subnets to the public route table
resource "aws_route_table_association" "public-subnets-assos" {
  count          = length(var.PubSubnet_cidr)
  subnet_id      = element(aws_subnet.dp_Pub-Subnet.*.id, count.index)
  route_table_id = aws_route_table.du_pub-rt.id
}


resource "aws_route_table" "du_private-rt" {
  vpc_id = aws_vpc.dp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id =  aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${local.project_name}-private-rt"
  }
}


# associate all private subnets to the private route table
resource "aws_route_table_association" "private-subnets-assoc" {
  count         = length(var.PubSubnet_cidr)
  subnet_id      = element(aws_subnet.dp_Prv-Subnet.*.id, count.index)
  route_table_id = aws_route_table.du_private-rt.id
}

