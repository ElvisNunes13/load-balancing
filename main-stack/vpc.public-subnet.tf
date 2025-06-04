resource "aws_subnet" "public" {
  count = length(var.vpc.public_subnets)

  vpc_id     = var.vpc.public_subnets[count.index].vpc_id
  cidr_block = var.vpc.public_subnets[count.index].cidr_block
  availability_zone = var.vpc.public_subnets[count.index].availability_zone
  map_public_ip_on_launch = var.vpc.public_subnets[count.index].map_public_ip_on_launch

  tags = {
    Name = var.vpc.public_subnets[count.index].name
  }
}