resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "this2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
}