resource "aws_acm_certificate" "TestMyCertificate" {
  domain_name       = "www.raymund.site"
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "TestMyCertificateValidation" {
  certificate_arn = aws_acm_certificate.TestMyCertificate.arn
}

data "aws_cloudfront_cache_policy" "cachingDisabled" {
  name = "Managed-CachingDisabled"
}

data "aws_s3_bucket" "test_aws_crc" {
  bucket = aws_s3_bucket.test_aws_crc.bucket
}

locals {
  # Unique id for the origin
  s3_origin_id        = "mytest-aws-crc-5555.s3-website-us-east-1.amazonaws.com"
  s3_website_endpoint = data.aws_s3_bucket.test_aws_crc.website_endpoint
}

resource "aws_cloudfront_distribution" "s3_test_distribution" {
  origin {
    # website_endpoint (deprecated); bucket_regional_domain, etc.not working
    # will need to figure out not to hardcode the s3 website origin 
    domain_name = local.s3_website_endpoint
    origin_id   = local.s3_origin_id
    custom_origin_config {
      origin_protocol_policy = "match-viewer"
      http_port              = 80
      https_port             = 443
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CF Test distribution"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    cache_policy_id  = data.aws_cloudfront_cache_policy.cachingDisabled.id

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.TestMyCertificate.arn
    ssl_support_method  = "sni-only"
  }
  # cloudfront as an alias
  aliases = ["www.raymund.site"]
}
