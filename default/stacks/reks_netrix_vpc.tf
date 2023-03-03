module "reks_netrix_vpc" {
  source = "../../"

  # VPC

  aws_account_id      = "318949518667"
  environment         = "dev"
  region              = "us-east-1"
  name                = "vpc-eks"
  cidr                = "10.1.0.0/16"
  private_subnets     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  public_subnets      = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]
  rds_subnets         = ["10.1.21.0/24", "10.1.22.0/24", "10.1.23.0/24"]
  azs                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  enable_nat_gateway  = false

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  enable_flow_log = false
  flow_log_destination_arn = "arn:aws:s3:::log-archive-centralized-vpc-flow-logs"

### TAGS

  tags = {
    application_name = "example-app"
    owner            = "cloud-engineering@edrans.com"
    environment      = "dev"
    prefix           = "edrans"
    costCenter       = "SYSENG"
    tagVersion       = "1"
    role             = "robotize-eks"
    project          = "robotize-eks"
    expirationDate   = "2023-09-02"
  }

}

