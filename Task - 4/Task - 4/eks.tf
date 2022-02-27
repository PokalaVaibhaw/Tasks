provider "aws"{
region = "us-west-1"
}
resource "aws_iam_user" "user_1" {
  name = "user_1"

  tags = {
    name = "user_1"
  }
}
data "aws_caller_identity" "user1" {}

resource "aws_iam_role" "eks_role" {
  name = "eks_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = "sts:AssumeRole",
        Principal = { "AWS" : "arn:aws:iam::${data.aws_caller_identity.user1.account_id}:user/user_1" }
    }]
  })
}

resource "aws_iam_policy" "eks_only" {
  name        = "eks_only"
  description = "allows only eks"
  policy      = file("policy.json")

}

resource "aws_iam_policy_attachment" "ekspolicyattach" {
  name       = "eks only"
  roles      = ["${aws_iam_role.eks_role.name}"]
  policy_arn = aws_iam_policy.eks_only.arn

}