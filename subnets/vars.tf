variable "env" {}
variable "vpc_id" {}
variable "cidr_block" {}
variable "availability_zone" {}
variable "default_vpc_id" {}
variable "name" {}
variable "vpc_peering_connection_id" {}
variable "internet_gw" {}
variable "nat_gw" {}
variable "common_tags" {}
variable "internet_gw_id" {
  default = null
}
variable "nat_gw_id" {
  default = null
}