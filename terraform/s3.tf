resource "aws_s3_bucket" "this" {
  bucket = "johndavidwatts.cloudresumechallenge"
}

resource "aws_s3_bucket" "lambda" {
  bucket = "johndavidwatts.cloudresumechallenge.lambda"
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}


resource "aws_s3_bucket_policy" "example" {
  depends_on = [aws_s3_bucket.this]
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_s3_object" "index" {
  depends_on = [aws_s3_bucket.this]
  bucket = "johndavidwatts.cloudresumechallenge"
  key    = "index.html"
  source = "../web/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "css" {
  depends_on = [aws_s3_bucket.this]
  bucket = "johndavidwatts.cloudresumechallenge"
  key    = "style.css"
  source = "../web/style.css"
  content_type = "text/css"
}

resource "aws_s3_object" "error" {
  depends_on = [aws_s3_bucket.this]
  bucket = "johndavidwatts.cloudresumechallenge"
  key    = "error.html"
  source = "../web/error.html"
  content_type = "text/html"
}

resource "aws_s3_object" "js" {
  depends_on = [aws_s3_bucket.this]
  bucket = "johndavidwatts.cloudresumechallenge"
  key    = "script.js"
  source = "../web/script.js"
  content_type = "application/javascript"
}