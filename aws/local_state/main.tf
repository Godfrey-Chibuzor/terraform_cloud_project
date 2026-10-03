terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "godfrey-postgres-backups-2026"
    key    = "terraform.tfstate"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-035c8a091035e710a"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform_Demo"
  }
}
