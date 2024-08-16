resource "aws_iam_role" "my_role" {
  name = "my_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the AmazonEC2FullAccess policy
resource "aws_iam_role_policy_attachment" "ec2_full_access" {
  role       = aws_iam_role.my_role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

# Attach the AmazonS3FullAccess policy
resource "aws_iam_role_policy_attachment" "s3_full_access" {
  role       = aws_iam_role.my_role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Attach the IAMFullAccess policy
resource "aws_iam_role_policy_attachment" "iam_full_access" {
  role       = aws_iam_role.my_role.name
  policy_arn  = "arn:aws:iam::aws:policy/IAMFullAccess"
}

# Attach the AmazonVPCFullAccess policy
resource "aws_iam_role_policy_attachment" "vpc_full_access" {
  role       = aws_iam_role.my_role.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}