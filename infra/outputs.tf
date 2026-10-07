//pass cf doman url as output : used in terminal
output "cloudfront_url" {
    description = "cloudfront final output url"
    value = module.cloudfront.cloudfront_url
}