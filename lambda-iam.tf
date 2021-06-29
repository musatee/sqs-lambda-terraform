# create role for lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = "${file("iam/lambda-role.json")}" 
} 

#assign policy to the lambda role
resource "aws_iam_role_policy" "lambda_role_policy" {
  name = "lambda_role_policy"
  role = aws_iam_role.lambda_role.id 
  policy = "${file("iam/lambda-role-policy.json")}" 
  #policy = "${file("iam/policy-on-sqs.json")}"
}
