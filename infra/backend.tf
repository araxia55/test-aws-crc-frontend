terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "test-crc-state-file"
    key            = "test.crc.terraform.tfstate"
    dynamodb_table = "test-crc-infra-state-lock-01"
    encrypt        = true
  }
}