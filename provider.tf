terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 4.18.0"
   }
 }

 backend "s3" {
   bucket = "tf-remote-s3-bucket-kim-changehere"
   key    = "state/terraform.tfstate"
   region = "us-east-1"
   encrypt = true
   dynamodb_table = "tf-s3-app-lock"
 }

provider "aws" {
  region = "us-east-1"
 }
}
 
