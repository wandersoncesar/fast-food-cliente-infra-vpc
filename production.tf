/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
  environment                   = "api-cliente"
}

provider "aws" {
  region = var.region
}

module "networking" {
  source               = "./networking"
  environment          = local.environment
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24", "10.0.20.0/24"]
  region               = var.region
  availability_zones   = local.production_availability_zones
  key_name             = "production_key"
}
