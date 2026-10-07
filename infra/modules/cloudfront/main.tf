resource "aws_cloudfront_distribution" "s3_distribution" {
    origin {
        domain_name = var.s3_origin_regional_domain_name
        origin_id = var.s3_origin_id
        origin_access_control_id = var.cf_oac_id
    }

    enabled             = true
    is_ipv6_enabled     = true
    comment             = "Some comment"
    default_root_object = "index.html"


    default_cache_behavior {
        allowed_methods  = ["GET", "HEAD"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = var.s3_origin_id

        forwarded_values {
            query_string = false

        cookies {
            forward = "none"
        }
        }

        viewer_protocol_policy = "redirect-to-https"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
  }


  #price_class = "PriceClass_200"

    restrictions {
        geo_restriction {
        restriction_type = "none"
        }
    }

    tags = {
        Name = "portfolio Cloudfront"
        Environment = "production"
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}

//OAC for S3 : required for private bucket
resource "aws_cloudfront_origin_access_control" "cf_oac" {
  name                              = "CF OAC for S3 bucket"
  description                       = "CF Origin Access Control for S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}