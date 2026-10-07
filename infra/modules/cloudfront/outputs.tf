output "cloudfront_distribution_arn" {
    description = "ARN of the cloudfront dist"
    value = aws_cloudfront_distribution.s3_distribution.arn
}

output "cloudfront_url" {
    description = "cloudfront final output url"
    value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_oac_id" {
    description = "cloudfront dist oac id"
    value = aws_cloudfront_origin_access_control.cf_oac.id
}