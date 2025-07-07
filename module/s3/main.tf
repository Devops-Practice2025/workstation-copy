resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucket

  tags = {
    Name        = var.bucket
    Environment = var.environment
  }
}
