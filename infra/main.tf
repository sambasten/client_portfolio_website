provider "aws" {
    region = var.aws_region
}

module "s3_bucket" {
    source = "./modules/s3"
}

module "cloudfront" {
    source = "./modules/cloudfront"
}