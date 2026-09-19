terraform {
  required_version = ">= 1.16.0, < 1.17.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "devops-app-terraform-state-avi6650-2026"
    key          = "devops-app/terraform.tfstate"
    region       = "ca-central-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_ecr_repository" "devops_app" {
  name = "devops-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "IMMUTABLE"
}