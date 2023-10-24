terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }
}


terraform {
  backend "s3" {
    bucket = "roboshop1-remote-state"
    key    = "catalogue-dev-deploy"
    region = "us-east-1"
    dynamodb_table = "roboshop-state-lock"     #here we are telling that terraform to dont store the .tf state file in local store it in the s3 and lock it with dynamodb
                                                
  }
}


provider "aws" {
  # Configuration options
  region = "us-east-1"
}