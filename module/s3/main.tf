resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-karthik-buket"

  tags = {
    Name        = "my-karthik-bucket"
    Environment = "Dev"
  }
}
