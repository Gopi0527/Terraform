resource "aws_vpc" "main" {
  cidr_block = var.vpc_network_cidr
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
 