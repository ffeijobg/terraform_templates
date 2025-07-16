resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3_role"
  assume_role_policy = file("assumerolepolicy.json")
}


resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A Test Policy"
  policy      = file("policys3bucket.json")
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.ec2_s3_acess_role.name}"]
  policy_arn = aws_iam_policy.policy.name
}