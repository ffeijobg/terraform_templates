resource "aws_s3_bucket" "example" {
  bucket = data.external.env.result["username"]

}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.example.id
}