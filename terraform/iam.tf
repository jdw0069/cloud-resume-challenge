data "aws_iam_policy_document" "s3_policy" {
  depends_on = [aws_s3_bucket.this]
  statement {
    principals {
    type        = "Service"
    identifiers = ["cloudfront.amazonaws.com"]
    }
    effect = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.this.arn}/*"]
    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = ["arn:aws:cloudfront::330049598018:distribution/E25KV94HU9ERT4"]
    }
  }

}
