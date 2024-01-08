resource "aws_iam_role" "this" {
  name               = local.iam.Name
  assume_role_policy = local.iam.assume_role_policy
}
resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = local.iam.policy_arn
  role       = aws_iam_role.this.name
}
resource "aws_iam_instance_profile" "this" {
  name = local.iam.Name
  role = aws_iam_role.this.name
}