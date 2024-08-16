//CREATING MY S3 BUCKET
resource "aws_s3_bucket" "caleb-project-terraform-bucket" {
  bucket = "kops-seuncaleb"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.caleb-project-terraform-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

  resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.caleb-project-terraform-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}


resource "aws_dynamodb_table" "terraform-state-lock" {
  name             = "terraform-state-lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}