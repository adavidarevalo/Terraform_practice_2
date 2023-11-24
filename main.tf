provider "aws" {
  region = var.region
}

resource "aws_vpc" "main1" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name     = "Main1"
    Location = "US"
  }
}

resource "aws_subnet" "Public_Subnet_1" {
  vpc_id = aws_vpc.main1.id
  #   cidr_block = element(var.subnet_cidr, count.index)
  cidr_block        = "192.168.10.0/24"
  availability_zone = "us-east-2a"
  #   availability_zone = element(var.azs, count.index)
  # count = length(var.azs)
  map_public_ip_on_launch = true
  tags = {
    Name = "Public_Subnet_1"
    # Name     = "Public_Subnet_${count.index + 1}"
    Location = "US"
  }

}

resource "aws_subnet" "Public_Subnet_2" {
  vpc_id = aws_vpc.main1.id
  #   cidr_block = element(var.subnet_cidr, count.index)
  cidr_block              = "192.168.20.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true
  #   availability_zone = element(var.azs, count.index)
  # count = length(var.azs)
  tags = {
    Name = "Public_Subnet_2"
    # Name     = "Public_Subnet_${count.index + 1}"
    Location = "US"
  }

}
resource "aws_subnet" "Public_Subnet_3" {
  vpc_id = aws_vpc.main1.id
  #   cidr_block = element(var.subnet_cidr, count.index)
  cidr_block              = "192.168.30.0/24"
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true

  #   availability_zone = element(var.azs, count.index)
  # count = length(var.azs)
  tags = {
    Name = "Public_Subnet_3"
    # Name     = "Public_Subnet_${count.index + 1}"
    Location = "US"
  }

}

resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.main1.id
  tags = {
    Name     = "VPC Gateway"
    Location = "US"
  }
}

resource "aws_route_table" "web_public_rt" {
  vpc_id = aws_vpc.main1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }
  tags = {
    Name = "Web_Public_RT"
  }
}

resource "aws_route_table_association" "public_rt_1" {
  # count = length(var.subnet_cidr)
  # subnet_id = aws_subnet.Public_Subnet_1[count.index].id
  subnet_id      = aws_subnet.Public_Subnet_1.id
  route_table_id = aws_route_table.web_public_rt.id
}

resource "aws_route_table_association" "public_rt_2" {
  # count = length(var.subnet_cidr)
  # subnet_id = aws_subnet.Public_Subnet_2[count.index].id
  subnet_id      = aws_subnet.Public_Subnet_2.id
  route_table_id = aws_route_table.web_public_rt.id
}
resource "aws_route_table_association" "public_rt_3" {
  # count = length(var.subnet_cidr)
  # subnet_id = aws_subnet.Public_Subnet_3[count.index].id
  subnet_id      = aws_subnet.Public_Subnet_3.id
  route_table_id = aws_route_table.web_public_rt.id
}
