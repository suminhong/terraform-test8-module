resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.alltag}-rtb-public"
  }
}

resource "aws_route" "rtb" {
  route_table_id         = aws_route_table.rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "rtb" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.rtb.id
}
