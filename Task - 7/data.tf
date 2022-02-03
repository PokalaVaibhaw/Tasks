data "aws_caller_identity" "user1" {}

data "aws_caller_identity" "user2" {
  provider = aws.user2
}

