resource "aws_security_group" "web1sg" {
  tags = {
    name = "web1sg"
  }
  name        = "web1sg"
  description = "This is for web1sg"
  vpc_id      = aws_vpc.main.id

}
resource "aws_security_group" "app1sg" {
  tags = {
    name = "app1sg"
  }
  name        = "app1sg"
  description = "This is for app1sg"
  vpc_id      = aws_vpc.main.id

}
resource "aws_security_group" "db1sg" {
  tags = {
    name = "db1sg"
  }
  name        = "db1sg"
  description = "This is for db1sg"
  vpc_id      = aws_vpc.main.id

}
resource "aws_security_group_rule" "web1sg_rules" {
  count             = length(var.web1_sg_config.rules)
  type              = var.web1_sg_config.rules[count.index].type
  from_port         = var.web1_sg_config.rules[count.index].from_port
  to_port           = var.web1_sg_config.rules[count.index].to_port
  protocol          = var.web1_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.web1_sg_config.rules[count.index].cidr_block]
  security_group_id = aws_security_group.web1sg.id
  depends_on = [
  aws_security_group.web1sg]
}

resource "aws_security_group_rule" "app1sg_rules" {
  count             = length(var.app1_sg_config.rules)
  type              = var.app1_sg_config.rules[count.index].type
  from_port         = var.app1_sg_config.rules[count.index].from_port
  to_port           = var.app1_sg_config.rules[count.index].to_port
  protocol          = var.app1_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.app1_sg_config.rules[count.index].cidr_block]
  security_group_id = aws_security_group.app1sg.id
  depends_on = [
  aws_security_group.app1sg]
}
resource "aws_security_group_rule" "db1sg_rules" {
  count             = length(var.db1_sg_config.rules)
  type              = var.db1_sg_config.rules[count.index].type
  from_port         = var.db1_sg_config.rules[count.index].from_port
  to_port           = var.db1_sg_config.rules[count.index].to_port
  protocol          = var.db1_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.db1_sg_config.rules[count.index].cidr_block]
  security_group_id = aws_security_group.db1sg.id
  depends_on = [
  aws_security_group.db1sg]
}