//general s3 website endpoint npt needed since ww are no longer public
# variable "s3_website_endpoint" {
#     description = "website endpoint from s3 output file"
# }

variable "s3_origin_id" {
    description = "name of the s3 bucket"
}

variable "s3_origin_regional_domain_name" {
    description = "regional domain name from s3 origin"
}