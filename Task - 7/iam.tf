### USER2 ACCOUNT ###

resource "aws_iam_role" "user2_list_s3" {
  name = "s3-list-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = "sts:AssumeRole",
        Principal = { "AWS" : "arn:aws:iam::${data.aws_caller_identity.user1.account_id}:root" }
    }]
  })
  provider = aws.user2
}

resource "aws_iam_policy" "s3_list_all" {
  name        = "s3_list_all"
  description = "allows listing all s3 buckets"
  policy      = file("role_permissions_policy.json")

  provider = aws.user2
}

resource "aws_iam_policy_attachment" "s3_list_all" {
  name       = "list s3 buckets policy to role"
  roles      = ["${aws_iam_role.user2_list_s3.name}"]
  policy_arn = aws_iam_policy.s3_list_all.arn
  provider   = aws.user2
}

### user1 ACCOUNT ###

resource "aws_iam_user" "random" {
  name = "random_user"

  tags = {
    name = "random"
  }
}
/*
resource "aws_iam_user" "random" {
  name          = "random_user"
  path          = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "random" {
  user    = aws_iam_user.random.name
  pgp_key = "keybase::"
  
}

output "password" {
  value = aws_iam_user_login_profile.random.encrypted_password
}
*/
resource "aws_iam_policy" "user2_s3" {
  name        = "user2_s3"
  description = "allow assuming user2_s3 role"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "sts:AssumeRole",
        Resource = "arn:aws:iam::${data.aws_caller_identity.user2.account_id}:role/${aws_iam_role.user2_list_s3.name}"
    }]
  })
}

resource "aws_iam_user_policy_attachment" "user2_s3" {
  user       = aws_iam_user.random.name
  policy_arn = aws_iam_policy.user2_s3.arn
}
