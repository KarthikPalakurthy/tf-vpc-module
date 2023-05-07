module "public_subnets" {
  source            = "./subnets"
  default_vpc_id    = var.default_vpc_id
  env               =var.env
  availability_zone = var.availability_zone

  for_each          = var.public_subnets
  cidr_block        = each.value.cidr_block
  name              = each.value.name
  internet_gw       = lookup(each.value, "internet_gw", false)
  nat_gw            = lookup(each.value, "nat_gw", false)

  vpc_id                    = aws_vpc.main.id
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
  gateway_id                = aws_internet_gateway.igw.id
  common_tags               =  local.common_tags
}


module "private_subnets" {
source            = "./subnets"
default_vpc_id    = var.default_vpc_id
env               =var.env
availability_zone = var.availability_zone

for_each          = var.public_subnets
cidr_block        = each.value.cidr_block
name              = each.value.name
internet_gw       = lookup(each.value, "internet_gw", false)
nat_gw            = lookup(each.value, "nat_gw", false)

vpc_id                    = aws_vpc.main.id
vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
nat_gw_id                 = aws_nat_gateway.ngw.id
common_tags               =  local.common_tags
}