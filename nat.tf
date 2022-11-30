# Create elastic ip
resource "aws_eip" "elastic" {
  vpc = true
}

# Create Nat-gateway
resource "aws_nat_gateway" "nat" {

  allocation_id     = aws_eip.elastic.id
  subnet_id         = aws_subnet.pub-sub-1.id
  connectivity_type = "public"
  tags = {
    Name = "mynat"
  }
}
