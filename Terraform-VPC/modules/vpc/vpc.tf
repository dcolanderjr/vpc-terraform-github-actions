#VPC
resource "aws_vpc" "vpc_name" {
  cidr_block        = var.vpc_cidr
  instance_tenancy  = var.instance_tenancy

    tags = var.vpc_tags

}

# 2 Subnets
resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidr)
  vpc_id                  = aws_vpc.vpc_name.id
  cidr_block              = var.subnet_cidr[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags ={
    Name = var.subnet_names[count.index]
  }
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_name.id

  tags = {
    Name = var.igw
  }
}

#Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_name.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.igw.id
    }

    tags = var.rt-tags
}

# Route Table Association
resource "aws_route_table_association" "rta" {
  count          = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id
}