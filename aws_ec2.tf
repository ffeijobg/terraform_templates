resource "aws_instance" "app_server" {
  count         = 2
  ami           = "ami-09d3b324b6c5d4aa"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-instance-${count.index}"
  }

  depends_on = [
    aws_s3_bucket.example
  ]
}