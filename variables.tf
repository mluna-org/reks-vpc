variable "cidr" {
  description = "CIDR block to associate with the VPC for eks networking"
  type        = string
  default     = ""
}

variable "public_subnets" {
  description = "define only if the subnet cannot be autocalculated or if the number of subnets needed is different from the number of azs"
  type        = list(string)
  default     = []
}

variable "rds_subnets" {
  description = "Subnet list for RDS and DB purposes"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "define only if the subnet cannot be autocalculated or if the number of subnets needed is different from the number of azs"
  type        = list(string)
  default     = []
}

variable "private_subnet_tags" {
  description = "Tags used to mark private subnets and allow ingress controller to autodiscover them"
  type        = map(any)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Tags used to mark public subnets and allow ingress controller to autodiscover them"
  type        = map(any)
  default     = {}
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = true
}

variable "propagate_private_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the Default VPC"
  default     = true
}

variable "enable_flow_log" {
  description = "Sholud be true to enable VPC Flow Logs"
  default = false
}

variable "flow_log_destination_type" {
  description = "Type of flow log destination"
  default = "s3"  
}

variable "flow_log_destination_arn" {
  description = "The ARN of the destination for VPC Flow Logs"
  type        = string
  default     = ""
}

variable "flow_log_file_format" {
  description = "The format for the flow log"
  default = "parquet" 
}

variable "manage_default_security_group" {
  description = "Should be true to adopt and manage default security group"
  default = true 
}

variable "eks_cluster" {
  description = "Map containing all EKS cluster configuration"
  type        = object({
    name                               = string
    cluster_version                    = string
    enable_irsa                        = bool
    manage_aws_auth                    = bool
    cluster_endpoint_private_access    = bool
    cluster_endpoint_public_access     = bool
    cluster_enabled_log_types          = list(string)
    worker_group_cpu_name              = string
    worker_group_spot_name             = string
    default_instance_types             = list(string)
    default_ami_type                   = string
    worker_group_cpu_asg_desired_size  = number
    worker_group_cpu_asg_max_size      = number
    worker_group_cpu_asg_min_size      = number
    worker_group_cpu_root_volume_size  = number
    worker_group_cpu_root_volume_type  = string
    worker_group_cpu_root_encrypted    = bool
    worker_group_spot_asg_desired_size = number
    worker_group_spot_asg_max_size     = number
    worker_group_spot_asg_min_size     = number
    worker_group_spot_root_volume_size = number
    worker_group_spot_root_volume_type = string
    worker_group_spot_root_encrypted   = bool
    aws_auth_roles                     = list(string)
    aws_auth_users                     = list(string)
  })
  default   = {
    name                               = "eks"
    cluster_version                    = "1.23"
    enable_irsa                        = true
    manage_aws_auth                    = true
    cluster_endpoint_private_access    = true
    cluster_endpoint_public_access     = true
    cluster_enabled_log_types          = ["audit", "controllerManager"]
    worker_group_cpu_name              = ""
    worker_group_spot_name             = ""
    default_instance_types             = [""]
    default_ami_type                   = ""
    worker_group_cpu_asg_desired_size  = 1
    worker_group_cpu_asg_max_size      = 1
    worker_group_cpu_asg_min_size      = 1
    worker_group_cpu_root_volume_size  = 100
    worker_group_cpu_root_volume_type  = ""
    worker_group_cpu_root_encrypted    = true
    worker_group_spot_asg_desired_size = 1
    worker_group_spot_asg_max_size     = 1
    worker_group_spot_asg_min_size     = 1
    worker_group_spot_root_volume_size = 100
    worker_group_spot_root_volume_type = ""
    worker_group_spot_root_encrypted   = true
    aws_auth_roles                     = []
    aws_auth_users                     = []
  }
}

variable "tags" {
  type = object({
    application_name = string
    owner            = string
    environment      = string
    prefix           = string
    costCenter       = string
    tagVersion       = number
    role             = string
    project          = string
    expirationDate   = string
  })
  description = "tags"
  default = {
    application_name = ""
    owner            = ""
    environment      = ""
    prefix           = ""
    costCenter       = ""
    tagVersion       = 1
    role             = ""
    project          = ""
    expirationDate   = "2023-09-02"
  }
}

variable "aws_account_id" {
  description = "The ARN of the destination for VPC Flow Logs"
  type        = string
  default     = ""
}

variable "environment" {
  description = "The ARN of the destination for VPC Flow Logs"
  type        = string
  default     = ""
}

variable "region" {
  description = "The ARN of the destination for VPC Flow Logs"
  type        = string
  default     = ""
}

variable "name" {
  description = "The ARN of the destination for VPC Flow Logs"
  type        = string
  default     = ""
}