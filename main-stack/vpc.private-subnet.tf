resource "aws_subnet" "private" {
  count = length(var.vpc.private_subnets)

  vpc_id     = var.vpc.private_subnets[count.index].vpc_id
  cidr_block = var.vpc.private_subnets[count.index].cidr_block
  availability_zone = var.vpc.private_subnets[count.index].availability_zone
  map_public_ip_on_launch = var.vpc.private_subnets[count.index].map_public_ip_on_launch

  tags = {
    Name = var.vpc.private_subnets[count.index].name
  }
}