# Create a simple driftctl demo IAM user. The random string is to ensure we're using a unique name.
resource "aws_iam_user" "driftctl_demo_user" {
  name = "driftctl-demo-${random_string.id.result}"

  tags = {
    Name = "driftctl-demo-${random_string.id.result} User"
  }
}

# Create an IAM keypar for the IAM user we created
resource "aws_iam_access_key" "driftctl_demo_user" {
  user = aws_iam_user.driftctl_demo_user.name
}

# Attach a ReadOnly policy to the IAM user we created
resource "aws_iam_user_policy_attachment" "driftctl_demo_user" {
  user       = aws_iam_user.driftctl_demo_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
