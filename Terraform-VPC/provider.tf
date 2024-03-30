terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.43.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "tfstate-devops-project-2024"
    key    = "DevOps/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}