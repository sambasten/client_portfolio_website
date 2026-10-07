resource "aws_s3_bucket" "s3_origin" {
    bucket = var.s3_bucket_name

    tags = {
      Name = var.s3_bucket_name
    }
}
#no longer making bucket public so as to goo through CF first
# resource "aws_s3_bucket_website_configuration" "s3_origin" {
#     bucket = aws_s3_bucket.s3_origin.id

#     index_document {
#         suffix = "index.html"
#     }

#     error_document {
#         key = "index.html"
#     }

# }

