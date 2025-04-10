resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "bucket-website-config" {
  bucket = aws_s3_bucket.bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket-policy-document.json
}

data "aws_iam_policy_document" "bucket-policy-document" {
  statement {
    sid    = "Allow CloudFront"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cloudfront-origin-access-id.iam_arn]
    }
    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.bucket.arn}/*"
    ]
  }
}

# Upload the www/index.html file to the S3 bucket
resource "aws_s3_object" "index-page" {
  bucket       = aws_s3_bucket.bucket.id
  key          = "index.html"
  source       = "www/index.html"
  content_type = "text/html"
  etag         = filemd5("www/index.html")
}
