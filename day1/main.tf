resource "aws_vpc" "main" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = "main"
  }

}
resource "aws_subnet" "web1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.web1_subnet_cidr
  tags = {
    Name = "web"
  }

}
resource "aws_subnet" "app" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.app_subnet_cidr
  tags = {
    Name = "app"
  }
}
resource "aws_subnet" "db" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db_subnet_cidr
  tags = {
    Name = "db"
  }

}
resource "aws_subnet" "web2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.web2_subnet_cidr
  tags = {
    Name = "web2"
  }
}
resource "aws_subnet" "app2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.app2_subnet_cidr
  tags = {
    Name = "app2"
  }
}

resource "aws_subnet" "db2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db2_subnet_cidr
  tags = {
    Name = "db2"
  }
}

