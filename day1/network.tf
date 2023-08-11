resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "subnets" {
  count      = length(var.subnet_names)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_ranges[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }
}

data "aws_route_table" "default" {
  vpc_id = aws_vpc.main.id

  depends_on = [
  aws_vpc.main]

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "mainigw"
  }
  depends_on = [aws_vpc.main]
}
resource "aws_route" "igwroute" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.igw
  ]
}