#also no longer needed since oac is through cf now
# output "s3_website_endpoint" {
#     description = "website endpoint from aws_s3_bucket_website_configuration resource"
#     value = aws_s3_bucket_website_configuration.s3_origin.website_endpoint
# }

output "s3_origin_id" {
    description = "name of the s3 bucket"
    value = aws_s3_bucket.s3_origin.id
}

output "s3_origin_regional_domain_name" {
    description = "regional domain name of s3 origin"
    value = aws_s3_bucket.s3_origin.bucket_regional_domain_name
}

output "s3_origin_arn" {
    description = "ARN of s3 bucket"
    value = aws_s3_bucket.s3_origin.arn
}