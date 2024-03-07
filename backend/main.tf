
# Edit bucket name before applying:
resource "aws_s3_bucket" "buckets" {
  count  = length(var.environment)
  bucket = "jc-${var.environment[count.index]}-tfstate-storage"
}
