terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 4.0"        # Use a version of the AWS provider that is compatible with version
    }
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)

  //TODO: Remover profile
  profile = "fast_food"
}

//TODO: Remover credenciais
provider "mongodbatlas" {
  public_key = "xkxsyhog"
  private_key  = "96915581-0bd0-405a-aa80-6627a37e41a5"
}
