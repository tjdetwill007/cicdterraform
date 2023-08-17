module "instance" {
    source = "../modules/ec2" 
    secg = module.vpc.sg
    instanceprofile = module.roles.roleec2
    subnet = module.vpc.subnetid
}
module "vpc" {
  source = "../modules/networks"
}
module "roles" {
  source = "../modules/iamroles"
}
module "s3" {
  source = "../modules/s3"
  bucketName="mycodedeploybucket2023"
}
module "codeDeploy" {
  source = "../modules/Codedeploy"
  role_arn = module.roles.rolearn
  getfromec2 = module.instance.instancename
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}