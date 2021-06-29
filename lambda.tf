#create archive of the code file
data "archive_file" "code_file" {
  type        = "zip"
  source_file = "function-code/hello.py"
  output_path = "outputs/hello.zip"
}


resource "aws_lambda_function" "test_lambda" {
  filename      = "outputs/hello.zip"
  function_name = "test_lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "hello.simple_hello"

 
  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.7"

} 
