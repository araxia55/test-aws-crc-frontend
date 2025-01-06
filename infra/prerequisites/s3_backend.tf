resource "aws_s3_bucket" "test-crc-state-file" {
  bucket = "test-crc-state-file"
}

resource "aws_s3_bucket_versioning" "test-crc-state-file" {
  bucket = aws_s3_bucket.test-crc-state-file.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "test-crc-state-file" {
  bucket = aws_s3_bucket.test-crc-state-file.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "test-crc-state-file" {
  depends_on = [aws_s3_bucket_ownership_controls.test-crc-state-file]

  bucket = aws_s3_bucket.test-crc-state-file.id
  acl    = "private"
}

resource "aws_dynamodb_table" "test-crc-infra-state-lock-01" {
  name         = "test-crc-infra-state-lock-01"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}