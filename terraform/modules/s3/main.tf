#Bucket Creation

resource "aws_s3_bucket" "myserverbucket" {
  bucket = var.bucketName

  tags = {
    Name        = "myserverbucket"
    Environment = "test"
  }
}