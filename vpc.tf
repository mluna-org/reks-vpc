locals {
  vpc_tags = {
    "kubernetes.io/cluster/${var.eks_cluster["name"]}" = "shared"
  }
}

module "vpc" {
  source                             = "terraform-aws-modules/vpc/aws"
  version                            = "3.19.0"
  tags                               = var.tags
  vpc_tags                           = merge(var.tags, local.vpc_tags)
  private_subnet_tags                = merge(var.tags, local.vpc_tags, var.private_subnet_tags)
  public_subnet_tags                 = merge(var.tags, local.vpc_tags, var.public_subnet_tags)
  name                               = "${var.tags["prefix"]}-vpc"
  cidr                               = var.cidr
  azs                                = var.azs
  private_subnets                    = local.private_subnet_cidrs
  public_subnets                     = local.public_subnet_cidrs
  database_subnets                   = var.rds_subnets
  enable_nat_gateway                 = var.enable_nat_gateway
  single_nat_gateway                 = var.single_nat_gateway
  one_nat_gateway_per_az             = var.one_nat_gateway_per_az
  propagate_private_route_tables_vgw = var.propagate_private_route_tables_vgw
  enable_vpn_gateway                 = var.enable_vpn_gateway
  enable_dns_hostnames               = var.enable_dns_hostnames
  enable_flow_log                    = var.enable_flow_log
  flow_log_destination_type          = var.flow_log_destination_type
  flow_log_destination_arn           = var.flow_log_destination_arn
  flow_log_file_format               = var.flow_log_file_format
  manage_default_security_group      = var.manage_default_security_group
  use_ipam_pool                      = false
}

