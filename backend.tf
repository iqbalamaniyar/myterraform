terraform {
  backend "s3" {
    bucket = "tests3126543"
    key    = "LockID"
    region = "ap-south-1"
    dynamodb_table = "my-dynamodb"
  }
}
