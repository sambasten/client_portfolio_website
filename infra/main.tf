terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
}

module "s3_bucket" {
    source = "./modules/s3"
}

module "cloudfront" {
    source = "./modules/cloudfront"

    s3_origin_id = module.s3_bucket.s3_origin_id
    s3_origin_regional_domain_name = module.s3_bucket.s3_origin_regional_domain_name
    cf_oac_id = module.cloudfront.cloudfront_oac_id
}

//S3 bucket pilocy {moved to main so it can consume cloudfront dist ARN as input}
//using a private bucket here with only cloufront origin allowed

data "aws_iam_policy_document" "allow_cf_access" {
    statement {
        sid = "StatementId1"

        effect = "Allow"

        principals {
            type = "Service"
            identifiers = ["cloudfront.amazonaws.com"]
        }

        actions = [
            "s3:GetObject",
        ]

        resources = [
            "${module.s3_bucket.s3_origin_arn}/*"
        ]

        condition  {
            test = "StringEquals"
            variable = "AWS:SourceArn"

            values = [
                module.cloudfront.cloudfront_distribution_arn
            ]
        }
    }
}

resource "aws_s3_bucket_policy" "allow_cf_access" {
    bucket = module.s3_bucket.s3_origin_id
    policy = data.aws_iam_policy_document.allow_cf_access.json
}